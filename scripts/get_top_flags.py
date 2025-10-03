#!/usr/bin/env python3
"""Extract top N flags for exhaustive search."""

import sys
sys.path.append('.')
from scripts import flags as flag_catalog

def get_top_flags(n=75, exclude_obfuscator_llvm=True):
    """Get top N flags sorted by obfuscation potential."""

    priority_weight = {'highest': 4, 'high': 3, 'medium': 2, 'low': 1, 'baseline': 0}

    flags_data = []
    for f in flag_catalog.comprehensive_flags:
        flag_str = f['flag']

        # Optionally exclude Obfuscator-LLVM specific flags (they don't work with standard clang)
        if exclude_obfuscator_llvm and flag_str.startswith('-mllvm -'):
            # Check if it's an obfuscation pass flag
            if any(x in flag_str for x in ['-fla', '-bcf', '-sub', '-split']):
                if '-bcf_loop' not in flag_str and '-bcf_prob' not in flag_str and '-sub_loop' not in flag_str:
                    continue

        score = f.get('obfuscation_score', 0)
        priority = f.get('priority', 'low')
        weight = priority_weight.get(priority, 0)
        combined_score = score + (weight * 2)

        flags_data.append({
            'flag': flag_str,
            'score': score,
            'priority': priority,
            'combined': combined_score,
            'category': f.get('category', 'unknown'),
            'desc': f.get('description', '')
        })

    # Sort by combined score
    flags_data.sort(key=lambda x: x['combined'], reverse=True)

    return flags_data[:n]

if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description='Get top N flags for obfuscation')
    parser.add_argument('-n', '--num', type=int, default=75, help='Number of flags to get')
    parser.add_argument('--include-obfuscator-llvm', action='store_true',
                       help='Include Obfuscator-LLVM specific flags (may fail on standard clang)')
    parser.add_argument('--list-only', action='store_true', help='Just list the flags')
    parser.add_argument('--command', action='store_true', help='Generate exhaustive search command')

    args = parser.parse_args()

    top_flags = get_top_flags(n=args.num, exclude_obfuscator_llvm=not args.include_obfuscator_llvm)

    if args.list_only:
        print(f'Top {len(top_flags)} flags:')
        for i, f in enumerate(top_flags, 1):
            print(f"{i:3}. {f['flag']:40} | Score: {f['score']} | Priority: {f['priority']:10} | {f['desc']}")
    elif args.command:
        flag_list = [f['flag'] for f in top_flags]
        print('# Exhaustive Search Command for Top', len(flag_list), 'Flags')
        print('# WARNING: This will test a HUGE number of combinations!')
        print()
        print('python3 scripts/exhaustive_flag_optimizer.py src/factorial_recursive.c \\')
        print('    --output-dir bin/exhaustive_top75 \\')
        print('    --results-file analysis/exhaustive_top75_results.json \\')
        print('    --max-flags 3 \\')
        for flag in flag_list:
            print(f'    --flag "{flag}" \\')
        print('    --save-all-binaries')
    else:
        print(f'Top {len(top_flags)} flags for maximum obfuscation:')
        print('=' * 100)
        print(f"{'Rank':<6} {'Flag':<45} {'Score':<7} {'Priority':<12} {'Category':<20}")
        print('-' * 100)
        for i, f in enumerate(top_flags, 1):
            print(f"{i:<6} {f['flag']:<45} {f['score']:<7} {f['priority']:<12} {f['category']:<20}")

        print()
        print('=' * 100)
        print(f'Total: {len(top_flags)} flags selected')
        print()
        print('Priority Distribution:')
        priority_counts = {}
        for f in top_flags:
            p = f['priority']
            priority_counts[p] = priority_counts.get(p, 0) + 1

        priority_weight = {'highest': 4, 'high': 3, 'medium': 2, 'low': 1, 'baseline': 0}
        for p, count in sorted(priority_counts.items(), key=lambda x: priority_weight.get(x[0], 0), reverse=True):
            print(f'  {p}: {count} flags')
