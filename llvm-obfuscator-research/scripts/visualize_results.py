#!/usr/bin/env python3
"""
Visualization Script
Generates charts and graphs from obfuscation test results
"""

import json
import csv
import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('Agg')  # Non-interactive backend
import numpy as np
from pathlib import Path
from datetime import datetime

# Project paths
PROJECT_ROOT = Path(__file__).parent.parent
ANALYSIS_DIR = PROJECT_ROOT / "analysis"

# Ensure output directory exists
CHARTS_DIR = ANALYSIS_DIR / "charts"
CHARTS_DIR.mkdir(exist_ok=True)


def load_latest_csv(pattern):
    """Load the most recent CSV file matching pattern"""
    files = sorted(ANALYSIS_DIR.glob(pattern), key=lambda x: x.stat().st_mtime, reverse=True)
    if not files:
        return None
    return files[0]


def load_latest_json(pattern):
    """Load the most recent JSON file matching pattern"""
    files = sorted(ANALYSIS_DIR.glob(pattern), key=lambda x: x.stat().st_mtime, reverse=True)
    if not files:
        return None

    with open(files[0], 'r') as f:
        return json.load(f)


def plot_binary_sizes(csv_file):
    """Create bar chart comparing binary sizes"""
    if not csv_file:
        print("No flag test results found")
        return

    # Read data
    configs = []
    sizes = []
    sources = []

    with open(csv_file, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row.get('success') == 'True' and row.get('source') == 'factorial_recursive.c':
                configs.append(row['config'])
                sizes.append(int(row['size']))
                sources.append(row['source'])

    if not configs:
        print("No data for binary size chart")
        return

    # Create chart
    plt.figure(figsize=(14, 8))
    bars = plt.bar(range(len(configs)), sizes, color='steelblue', alpha=0.8)

    # Highlight smallest and largest
    min_idx = sizes.index(min(sizes))
    max_idx = sizes.index(max(sizes))
    bars[min_idx].set_color('green')
    bars[max_idx].set_color('red')

    plt.xlabel('Configuration', fontsize=12)
    plt.ylabel('Binary Size (bytes)', fontsize=12)
    plt.title('Binary Size Comparison - factorial_recursive.c', fontsize=14, fontweight='bold')
    plt.xticks(range(len(configs)), configs, rotation=45, ha='right')
    plt.grid(axis='y', alpha=0.3)
    plt.tight_layout()

    output_file = CHARTS_DIR / f"binary_sizes_{datetime.now().strftime('%Y%m%d_%H%M%S')}.png"
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    plt.close()

    print(f"✓ Binary size chart saved: {output_file}")


def plot_obfuscation_vs_performance(csv_file):
    """Scatter plot of obfuscation score vs performance impact"""
    if not csv_file:
        return

    # Read data
    scores = []
    size_ratios = []
    labels = []

    with open(csv_file, 'r') as f:
        reader = csv.DictReader(f)
        data = list(reader)

    # Get baseline for each source
    baselines = {}
    for row in data:
        if row.get('config') == 'baseline_O0' and row.get('success') == 'True':
            baselines[row['source']] = int(row['size'])

    # Calculate ratios
    for row in data:
        if row.get('success') == 'True' and row['source'] in baselines and row['config'] != 'baseline_O0':
            try:
                score = float(row.get('obfuscation_score', 0))
                size = int(row['size'])
                baseline_size = baselines[row['source']]
                ratio = (size / baseline_size) if baseline_size > 0 else 1.0

                scores.append(score)
                size_ratios.append(ratio)
                labels.append(row['config'])
            except (ValueError, ZeroDivisionError):
                continue

    if not scores:
        print("No data for obfuscation vs performance chart")
        return

    # Create scatter plot
    plt.figure(figsize=(12, 8))
    scatter = plt.scatter(size_ratios, scores, s=100, alpha=0.6, c=scores, cmap='RdYlGn')

    # Add labels for interesting points
    for i, label in enumerate(labels):
        if scores[i] > np.percentile(scores, 75) or scores[i] < np.percentile(scores, 25):
            plt.annotate(label, (size_ratios[i], scores[i]),
                        xytext=(5, 5), textcoords='offset points',
                        fontsize=8, alpha=0.7)

    plt.xlabel('Binary Size Ratio (vs baseline)', fontsize=12)
    plt.ylabel('Obfuscation Score', fontsize=12)
    plt.title('Obfuscation Score vs Performance Impact', fontsize=14, fontweight='bold')
    plt.colorbar(scatter, label='Obfuscation Score')
    plt.axhline(y=0, color='gray', linestyle='--', alpha=0.3)
    plt.axvline(x=1, color='gray', linestyle='--', alpha=0.3)
    plt.grid(alpha=0.3)
    plt.tight_layout()

    output_file = CHARTS_DIR / f"obfuscation_vs_performance_{datetime.now().strftime('%Y%m%d_%H%M%S')}.png"
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    plt.close()

    print(f"✓ Obfuscation vs performance chart saved: {output_file}")


def plot_metric_heatmap(csv_file):
    """Create heatmap showing various metrics across configurations"""
    if not csv_file:
        return

    # Read data for one source
    configs = []
    metrics = {
        'size': [],
        'string_count': [],
        'symbol_count': [],
        'function_count': [],
        'obfuscation_score': []
    }

    with open(csv_file, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row.get('success') == 'True' and row.get('source') == 'factorial_recursive.c':
                configs.append(row['config'])
                for key in metrics:
                    try:
                        metrics[key].append(float(row.get(key, 0)))
                    except (ValueError, TypeError):
                        metrics[key].append(0)

    if not configs:
        print("No data for heatmap")
        return

    # Normalize metrics to 0-1 scale for comparison
    normalized_data = []
    metric_names = list(metrics.keys())

    for metric_name in metric_names:
        values = metrics[metric_name]
        if max(values) > 0:
            normalized = [v / max(values) for v in values]
        else:
            normalized = values
        normalized_data.append(normalized)

    # Create heatmap
    fig, ax = plt.subplots(figsize=(14, 8))
    im = ax.imshow(normalized_data, cmap='YlOrRd', aspect='auto')

    # Set ticks
    ax.set_xticks(np.arange(len(configs)))
    ax.set_yticks(np.arange(len(metric_names)))
    ax.set_xticklabels(configs, rotation=45, ha='right')
    ax.set_yticklabels(metric_names)

    # Add colorbar
    cbar = plt.colorbar(im, ax=ax)
    cbar.set_label('Normalized Value', rotation=270, labelpad=20)

    # Add text annotations
    for i in range(len(metric_names)):
        for j in range(len(configs)):
            text = ax.text(j, i, f'{normalized_data[i][j]:.2f}',
                          ha="center", va="center", color="black", fontsize=7)

    ax.set_title('Metric Comparison Heatmap - factorial_recursive.c',
                 fontsize=14, fontweight='bold', pad=20)
    plt.tight_layout()

    output_file = CHARTS_DIR / f"metric_heatmap_{datetime.now().strftime('%Y%m%d_%H%M%S')}.png"
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    plt.close()

    print(f"✓ Metric heatmap saved: {output_file}")


def plot_ir_complexity(json_file):
    """Plot IR complexity metrics across optimization levels"""
    if not json_file:
        print("No IR analysis results found")
        return

    data = load_latest_json('ir_analysis_*.json')
    if not data:
        return

    # Group by source
    sources = {}
    for entry in data:
        source = entry['source']
        if source not in sources:
            sources[source] = []
        sources[source].append(entry)

    # Create subplots for each source
    fig, axes = plt.subplots(1, 3, figsize=(18, 6))

    for idx, (source, entries) in enumerate(sources.items()):
        if idx >= 3:
            break

        ax = axes[idx]

        # Sort by opt level
        entries.sort(key=lambda x: x['opt_level'])

        opt_levels = [e['opt_level'] for e in entries]
        functions = [e['function_count'] for e in entries]
        instructions = [e['instruction_count'] for e in entries]
        complexity = [e['complexity'] for e in entries]

        x = np.arange(len(opt_levels))
        width = 0.25

        ax.bar(x - width, functions, width, label='Functions', alpha=0.8)
        ax.bar(x, [i/10 for i in instructions], width, label='Instructions/10', alpha=0.8)
        ax.bar(x + width, [c/100 for c in complexity], width, label='Complexity/100', alpha=0.8)

        ax.set_xlabel('Optimization Level', fontsize=10)
        ax.set_ylabel('Count', fontsize=10)
        ax.set_title(f'IR Metrics - {source}', fontsize=11, fontweight='bold')
        ax.set_xticks(x)
        ax.set_xticklabels([f'O{level}' for level in opt_levels])
        ax.legend()
        ax.grid(axis='y', alpha=0.3)

    plt.tight_layout()

    output_file = CHARTS_DIR / f"ir_complexity_{datetime.now().strftime('%Y%m%d_%H%M%S')}.png"
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    plt.close()

    print(f"✓ IR complexity chart saved: {output_file}")


def plot_top_configurations(csv_file):
    """Bar chart showing top configurations by obfuscation score"""
    if not csv_file:
        return

    # Read all data
    all_data = []
    with open(csv_file, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row.get('success') == 'True':
                try:
                    score = float(row.get('obfuscation_score', 0))
                    all_data.append({
                        'config': row['config'],
                        'source': row['source'],
                        'score': score
                    })
                except (ValueError, TypeError):
                    continue

    # Sort by score
    all_data.sort(key=lambda x: x['score'], reverse=True)

    # Take top 10
    top_10 = all_data[:10]

    if not top_10:
        print("No data for top configurations chart")
        return

    configs = [f"{d['config']}\n({d['source'][:15]})" for d in top_10]
    scores = [d['score'] for d in top_10]

    # Create chart
    plt.figure(figsize=(14, 8))
    colors = plt.cm.RdYlGn(np.linspace(0.3, 0.9, len(configs)))
    bars = plt.barh(range(len(configs)), scores, color=colors, alpha=0.8)

    plt.ylabel('Configuration', fontsize=12)
    plt.xlabel('Obfuscation Score', fontsize=12)
    plt.title('Top 10 Obfuscation Configurations', fontsize=14, fontweight='bold')
    plt.yticks(range(len(configs)), configs)
    plt.grid(axis='x', alpha=0.3)

    # Add value labels
    for i, (bar, score) in enumerate(zip(bars, scores)):
        plt.text(score, i, f'  {score:.2f}', va='center', fontsize=9)

    plt.tight_layout()

    output_file = CHARTS_DIR / f"top_configurations_{datetime.now().strftime('%Y%m%d_%H%M%S')}.png"
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    plt.close()

    print(f"✓ Top configurations chart saved: {output_file}")


def main():
    """Main execution function"""
    print("Obfuscation Results Visualization")
    print("=" * 60)

    # Find latest result files
    flag_test_csv = load_latest_csv('flag_test_results_*.csv')
    ir_analysis_json = load_latest_csv('ir_analysis_*.json')

    if not flag_test_csv:
        print("Error: No test results found!")
        print("Run test_llvm_flags.py first to generate data")
        return

    print(f"Loading data from: {flag_test_csv.name}")
    print()

    # Generate visualizations
    print("Generating visualizations...")
    print()

    plot_binary_sizes(flag_test_csv)
    plot_obfuscation_vs_performance(flag_test_csv)
    plot_metric_heatmap(flag_test_csv)
    plot_top_configurations(flag_test_csv)

    if ir_analysis_json:
        plot_ir_complexity(ir_analysis_json)

    print()
    print("=" * 60)
    print("Visualization complete!")
    print(f"Charts saved to: {CHARTS_DIR}")
    print()
    print("Generated charts:")
    for chart in sorted(CHARTS_DIR.glob("*.png")):
        print(f"  - {chart.name}")


if __name__ == "__main__":
    main()
