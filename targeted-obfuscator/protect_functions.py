#!/usr/bin/env python3
"""
Targeted Function Protection CLI
Main interface for analyzing, hardening, and reporting
"""

import sys
import argparse
import json
from pathlib import Path

# Add project to path
sys.path.insert(0, str(Path(__file__).parent))

from analyzer.critical_detector import CriticalFunctionDetector, CriticalityLevel
from transforms.string_encryptor import StringConstantEncryptor
from transforms.cfg_flattener import FunctionCFGFlattener
from transforms.opaque_predicates import OpaquePredicateInjector
from vm.micro_vm import MicroVM
from metrics.profiler import ObfuscationProfiler


class ProgressiveHardener:
    """Apply protections incrementally with measurement"""

    def __init__(self, source_file: str, measure_each_layer: bool = True):
        """
        Initialize hardener

        Args:
            source_file: Path to C/C++ source file
            measure_each_layer: Whether to measure impact after each layer
        """
        self.source_file = source_file
        self.measure_each_layer = measure_each_layer
        self.results = []

    def harden_incrementally(
        self,
        function_names: list,
        max_level: int = 3,
        output_file: str = None
    ) -> dict:
        """
        Apply protections layer by layer

        Args:
            function_names: List of functions to protect
            max_level: Maximum protection level (1-4)
            output_file: Output file for protected code

        Returns:
            Dictionary with results for each layer
        """

        print(f"🔒 Progressive Hardening: {', '.join(function_names)}")
        print(f"   Max level: {max_level}")
        print(f"   Measuring each layer: {self.measure_each_layer}\n")

        # Read source
        with open(self.source_file, 'r') as f:
            original_code = f.read()

        current_code = original_code
        layer_results = []

        # Apply each layer progressively
        if max_level >= 1:
            print("📦 Layer 1: String Encryption")
            current_code, metrics = self._apply_layer1(current_code, function_names)
            layer_results.append(('Layer 1: String Encryption', current_code, metrics))
            print(f"   ✓ {metrics['total_strings_encrypted']} strings encrypted\n")

        if max_level >= 2:
            print("🔀 Layer 2: Control Flow Flattening")
            current_code, metrics = self._apply_layer2(current_code, function_names)
            layer_results.append(('Layer 2: CFG Flattening', current_code, metrics))
            print(f"   ✓ {metrics['total_blocks']} blocks created ({metrics['fake_blocks']} fake)\n")

        if max_level >= 3:
            print("🎭 Layer 3: Opaque Predicates")
            current_code, metrics = self._apply_layer3(current_code, function_names)
            layer_results.append(('Layer 3: Opaque Predicates', current_code, metrics))
            print(f"   ✓ {metrics['total_predicates_injected']} predicates injected\n")

        if max_level >= 4:
            print("🖥️  Layer 4: VM Virtualization (Maximum Protection)")
            current_code, metrics = self._apply_layer4(current_code, function_names)
            layer_results.append(('Layer 4: VM', current_code, metrics))
            print(f"   ✓ Bytecode size: {metrics['bytecode_size']} bytes\n")

        # Write output
        if output_file:
            with open(output_file, 'w') as f:
                f.write(current_code)
            print(f"✅ Protected code written to: {output_file}")

        return {
            'layers_applied': len(layer_results),
            'layer_results': [
                {'name': name, 'metrics': metrics}
                for name, code, metrics in layer_results
            ],
            'final_code': current_code
        }

    def _apply_layer1(self, code: str, function_names: list) -> tuple:
        """Apply string encryption layer"""

        encryptor = StringConstantEncryptor(algorithm='xor')

        # For simplicity, apply to first function
        # Production would handle multiple functions
        if function_names:
            import re
            func_name = function_names[0]
            pattern = rf'(\w+[\s\*]+)?{func_name}\s*\([^)]*\)\s*\{{.*?\}}'
            match = re.search(pattern, code, re.DOTALL)

            if match:
                func_code = match.group(0)
                protected = encryptor.protect_function(func_code, func_name)
                code = code.replace(func_code, protected)

        return code, encryptor.get_encryption_report()

    def _apply_layer2(self, code: str, function_names: list) -> tuple:
        """Apply CFG flattening layer"""

        flattener = FunctionCFGFlattener(num_fake_states=5)

        if function_names:
            import re
            func_name = function_names[0]
            pattern = rf'(\w+[\s\*]+)?{func_name}\s*\([^)]*\)\s*\{{.*?\}}'
            match = re.search(pattern, code, re.DOTALL)

            if match:
                func_code = match.group(0)
                try:
                    flattened = flattener.flatten_function(func_code, func_name)
                    code = code.replace(func_code, flattened)
                except Exception as e:
                    print(f"   ⚠️  Warning: CFG flattening failed: {e}")

        return code, flattener.get_flattening_report()

    def _apply_layer3(self, code: str, function_names: list) -> tuple:
        """Apply opaque predicates layer"""

        injector = OpaquePredicateInjector(complexity='medium', predicates_per_branch=2)

        if function_names:
            import re
            func_name = function_names[0]
            pattern = rf'(\w+[\s\*]+)?{func_name}\s*\([^)]*\)\s*\{{.*?\}}'
            match = re.search(pattern, code, re.DOTALL)

            if match:
                func_code = match.group(0)
                protected = injector.inject_predicates(func_code, func_name)
                code = code.replace(func_code, protected)

        return code, injector.get_injection_report()

    def _apply_layer4(self, code: str, function_names: list) -> tuple:
        """Apply VM virtualization layer"""

        vm = MicroVM(encrypt_bytecode=True, obfuscate_interpreter=True)

        if function_names:
            import re
            func_name = function_names[0]
            pattern = rf'(\w+[\s\*]+)?{func_name}\s*\([^)]*\)\s*\{{.*?\}}'
            match = re.search(pattern, code, re.DOTALL)

            if match:
                func_code = match.group(0)
                try:
                    virtualized = vm.virtualize_function(func_code, func_name)
                    code = code.replace(func_code, virtualized)
                except Exception as e:
                    print(f"   ⚠️  Warning: VM virtualization failed: {e}")

        return code, vm.get_virtualization_report()


def command_analyze(args):
    """Analyze source code for critical functions"""

    print(f"🔍 Analyzing {args.source_file} for critical functions...\n")

    detector = CriticalFunctionDetector(max_functions=args.max_functions)
    functions = detector.analyze_source(args.source_file)

    if not functions:
        print("No critical functions detected.")
        return

    print(f"Found {len(functions)} critical function(s):\n")

    for i, func in enumerate(functions, 1):
        print(f"{i}. {func.name}()")
        print(f"   Criticality: {func.criticality.name}")
        print(f"   Location: {func.file_path}:{func.line_number}")
        print(f"   Category: {func.category}")
        print(f"   Recommended layers: {', '.join(func.recommended_protections)}")
        print()

    # Export if requested
    if args.output:
        if args.output.endswith('.yaml'):
            detector.export_to_yaml(functions, args.output)
        else:
            detector.export_to_json(functions, args.output)

        print(f"✅ Results exported to: {args.output}")


def command_harden(args):
    """Harden functions with progressive protection"""

    # Parse function names
    function_names = args.functions.split(',')

    print(f"🛡️  Hardening functions: {', '.join(function_names)}\n")

    # Create hardener
    hardener = ProgressiveHardener(
        args.source_file,
        measure_each_layer=args.measure_each_layer
    )

    # Apply protections
    results = hardener.harden_incrementally(
        function_names=function_names,
        max_level=args.max_level,
        output_file=args.output
    )

    print(f"\n📊 Summary:")
    print(f"   Layers applied: {results['layers_applied']}")

    for layer_result in results['layer_results']:
        print(f"   - {layer_result['name']}")


def command_report(args):
    """Generate impact analysis report"""

    print(f"📈 Generating impact report...\n")

    # Compile binaries
    print("Compiling binaries...")

    import subprocess

    # Compile original
    subprocess.run(
        ['clang', args.original, '-o', '/tmp/original_binary'],
        capture_output=True
    )

    # Compile protected
    subprocess.run(
        ['clang', args.protected, '-o', '/tmp/protected_binary'],
        capture_output=True
    )

    # Profile
    profiler = ObfuscationProfiler(test_runs=10)
    results = profiler.measure_impact(
        '/tmp/original_binary',
        '/tmp/protected_binary'
    )

    # Output
    if args.output:
        with open(args.output, 'w') as f:
            json.dump(results, f, indent=2)
        print(f"✅ Report written to: {args.output}")
    else:
        print(json.dumps(results, indent=2))


def main():
    """Main CLI entry point"""

    parser = argparse.ArgumentParser(
        description='Targeted Function Protection System',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Analyze for critical functions
  protect-functions analyze source.c --output critical.yaml

  # Apply progressive protection
  protect-functions harden source.c \\
    --functions validate_license_key,decrypt_data \\
    --max-level 3 \\
    --output protected.c

  # Generate impact report
  protect-functions report \\
    --original source.c \\
    --protected protected.c \\
    --output impact.json
        """
    )

    subparsers = parser.add_subparsers(dest='command', help='Commands')

    # Analyze command
    analyze_parser = subparsers.add_parser('analyze', help='Analyze for critical functions')
    analyze_parser.add_argument('source_file', help='Source file to analyze')
    analyze_parser.add_argument('--max-functions', type=int, default=5,
                                 help='Max functions to return (default: 5)')
    analyze_parser.add_argument('--output', help='Output file (YAML or JSON)')

    # Harden command
    harden_parser = subparsers.add_parser('harden', help='Apply progressive protection')
    harden_parser.add_argument('source_file', help='Source file to protect')
    harden_parser.add_argument('--functions', required=True,
                                help='Comma-separated function names')
    harden_parser.add_argument('--max-level', type=int, choices=[1, 2, 3, 4], default=3,
                                help='Max protection level (1-4, default: 3)')
    harden_parser.add_argument('--measure-each-layer', action='store_true',
                                help='Measure impact after each layer')
    harden_parser.add_argument('--output', required=True,
                                help='Output file for protected code')

    # Report command
    report_parser = subparsers.add_parser('report', help='Generate impact report')
    report_parser.add_argument('--original', required=True,
                                help='Original source file')
    report_parser.add_argument('--protected', required=True,
                                help='Protected source file')
    report_parser.add_argument('--output', help='Output file (JSON)')

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 1

    # Execute command
    if args.command == 'analyze':
        command_analyze(args)
    elif args.command == 'harden':
        command_harden(args)
    elif args.command == 'report':
        command_report(args)

    return 0


if __name__ == '__main__':
    sys.exit(main())
