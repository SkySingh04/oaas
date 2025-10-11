#!/usr/bin/env python3
"""
Opaque Predicate Injection Layer (Layer 3)
Injects hard-to-analyze conditionals that always evaluate the same way
"""

import re
import random
from typing import List, Dict, Tuple
from enum import Enum


class PredicateType(Enum):
    """Types of opaque predicates"""
    ALWAYS_TRUE = "always_true"
    ALWAYS_FALSE = "always_false"
    CONTEXT_DEPENDENT = "context_dependent"


class OpaquePredicateInjector:
    """Third layer - inject hard-to-analyze conditionals"""

    # Always true predicates (mathematically guaranteed)
    ALWAYS_TRUE_PREDICATES = [
        # Mathematical invariants
        "({var} * {var}) >= 0",  # Squares are non-negative
        "({var} | ~{var}) == -1",  # Bitwise OR with complement
        "({var} ^ {var}) == 0",  # XOR with self
        "({var} + 1) > {var} || {var} == INT_MAX",  # Overflow check
        "({var} - {var}) == 0",  # Self subtraction

        # Pointer properties
        "((uintptr_t)&{func} % sizeof(void*)) == 0",  # Pointer alignment
        "sizeof({type}) > 0",  # Types have size

        # Time-based (probabilistically true)
        "(time(NULL) & 0x7FFFFFFF) > 0",  # Unix timestamp positive
        "(clock() >= 0)",  # Clock always returns non-negative

        # Process-based
        "(getpid() > 0)",  # PID always positive on Unix
    ]

    # Always false predicates (mathematically impossible)
    ALWAYS_FALSE_PREDICATES = [
        # Mathematical impossibilities
        "({var} < {var})",  # Value less than itself
        "({var} != {var})",  # Value not equal to itself
        "({var} * 0) != 0",  # Zero product
        "(({var} & 1) && !({var} & 1))",  # Contradictory conditions

        # Absurd comparisons
        "(sizeof({type}) == 0)",  # Zero-size type
        "((int*)0 != NULL)",  # NULL check
        "(1 > 2)",  # Constant false
        "({var} > INT_MAX)",  # Impossible overflow

        # Modulo impossibilities
        "({var} % 2 == 3)",  # Remainder can't be > divisor
        "(rand() % 4 >= 4)",  # Modulo range
    ]

    # Context-dependent predicates (usually true/false based on execution context)
    CONTEXT_DEPENDENT_PREDICATES = [
        # Alignment checks (usually true)
        "((uintptr_t)&{var} % 4) == 0",  # Stack variables usually aligned

        # Cache line alignment (sometimes true)
        "((uintptr_t)&{func} % 64) == 0",  # Function alignment

        # Stack growth direction (architecture-dependent)
        "(&{var} < (int*)0x7FFFFFFF)",  # Stack address range

        # Optimization hints (compiler-dependent)
        "(__builtin_expect(({var} != 0), 1))",  # Branch prediction
    ]

    def __init__(self, complexity: str = 'medium', predicates_per_branch: int = 2):
        """
        Initialize injector

        Args:
            complexity: low, medium, or high
            predicates_per_branch: Number of predicates to inject per branch
        """
        self.complexity = complexity
        self.predicates_per_branch = predicates_per_branch
        self.injected_count = 0
        self.var_counter = 0

    def inject_predicates(self, function_code: str, function_name: str) -> str:
        """
        Inject opaque predicates into function

        Args:
            function_code: The function's source code
            function_name: Name of the function

        Returns:
            Modified function code with opaque predicates
        """
        self.injected_count = 0
        self.var_counter = 0

        modified = function_code

        # Step 1: Inject before critical operations (comparisons, returns)
        modified = self._inject_before_comparisons(modified)

        # Step 2: Inject before return statements
        modified = self._inject_before_returns(modified)

        # Step 3: Add dead code branches
        if self.complexity in ['medium', 'high']:
            modified = self._add_dead_code_branches(modified)

        # Step 4: Add opaque predicates around critical checks
        if self.complexity == 'high':
            modified = self._wrap_critical_operations(modified)

        return modified

    def _inject_before_comparisons(self, code: str) -> str:
        """Inject opaque predicates before comparison operations"""

        lines = code.split('\n')
        modified_lines = []

        for line in lines:
            # Check if line contains comparison
            if any(op in line for op in ['strcmp', 'strncmp', 'memcmp', '==', '!=']):
                # Don't inject in comments or strings
                if line.strip().startswith('//') or line.strip().startswith('/*'):
                    modified_lines.append(line)
                    continue

                # Get indentation
                indent = len(line) - len(line.lstrip())
                indent_str = ' ' * indent

                # Generate opaque predicate
                predicate = self._generate_opaque_predicate(PredicateType.ALWAYS_TRUE)

                # Inject before comparison
                injected = f"{indent_str}// Opaque predicate (always true)\n"
                injected += f"{indent_str}if ({predicate}) {{\n"
                injected += f"{line}\n"
                injected += f"{indent_str}}}\n"

                modified_lines.append(injected)
                self.injected_count += 1
            else:
                modified_lines.append(line)

        return '\n'.join(modified_lines)

    def _inject_before_returns(self, code: str) -> str:
        """Inject opaque predicates before return statements"""

        lines = code.split('\n')
        modified_lines = []

        for line in lines:
            if 'return' in line and not line.strip().startswith('//'):
                # Get indentation
                indent = len(line) - len(line.lstrip())
                indent_str = ' ' * indent

                # Generate context-dependent predicate
                predicate = self._generate_opaque_predicate(PredicateType.CONTEXT_DEPENDENT)

                # Inject before return
                injected = f"{indent_str}// Context-dependent opaque predicate\n"
                injected += f"{indent_str}if ({predicate}) {{\n"
                injected += f"{line}\n"
                injected += f"{indent_str}}}\n"

                modified_lines.append(injected)
                self.injected_count += 1
            else:
                modified_lines.append(line)

        return '\n'.join(modified_lines)

    def _add_dead_code_branches(self, code: str) -> str:
        """Add branches with dead code (never executed)"""

        lines = code.split('\n')
        modified_lines = []

        # Inject dead code at random positions (but not too many)
        num_injections = min(3, len(lines) // 10)

        injection_positions = random.sample(range(len(lines)), num_injections)

        for i, line in enumerate(lines):
            modified_lines.append(line)

            if i in injection_positions and line.strip() and not line.strip().startswith('//'):
                # Get indentation
                indent = len(line) - len(line.lstrip())
                indent_str = ' ' * indent

                # Generate always-false predicate
                predicate_lines = self._generate_opaque_predicate(PredicateType.ALWAYS_FALSE).split('\n')
                declaration = predicate_lines[0] if len(predicate_lines) > 1 else ""
                condition = predicate_lines[1] if len(predicate_lines) > 1 else predicate_lines[0]

                # Generate dead code
                dead_code = self._generate_dead_code()

                # Inject dead branch
                injected = f"\n{indent_str}// Dead code branch (never taken)\n"
                if declaration:
                    injected += f"{indent_str}{declaration}\n"
                injected += f"{indent_str}{condition} {{\n"
                for dead_line in dead_code.split('\n'):
                    if dead_line.strip():
                        injected += f"{indent_str}    {dead_line}\n"
                injected += f"{indent_str}}}\n"

                modified_lines.append(injected)
                self.injected_count += 1

        return '\n'.join(modified_lines)

    def _wrap_critical_operations(self, code: str) -> str:
        """Wrap critical operations in multiple opaque predicates"""

        # Find critical operations (authentications, validations)
        critical_patterns = [
            r'validate_',
            r'check_',
            r'verify_',
            r'authenticate',
        ]

        lines = code.split('\n')
        modified_lines = []

        for line in lines:
            # Check if this is a critical operation
            is_critical = any(re.search(pattern, line) for pattern in critical_patterns)

            if is_critical and not line.strip().startswith('//'):
                # Get indentation
                indent = len(line) - len(line.lstrip())
                indent_str = ' ' * indent

                # Wrap in multiple predicates
                wrapped = ""
                for j in range(self.predicates_per_branch):
                    pred_type = random.choice([
                        PredicateType.ALWAYS_TRUE,
                        PredicateType.CONTEXT_DEPENDENT
                    ])
                    predicate = self._generate_opaque_predicate(pred_type)

                    wrapped += f"{indent_str}// Layered opaque predicate {j+1}\n"
                    wrapped += f"{indent_str}if ({predicate}) {{\n"
                    indent_str += "    "

                # Add the actual line
                wrapped += f"{indent_str}{line.strip()}\n"

                # Close all predicates
                for j in range(self.predicates_per_branch):
                    indent_str = indent_str[:-4]
                    wrapped += f"{indent_str}}}\n"

                modified_lines.append(wrapped)
                self.injected_count += self.predicates_per_branch
            else:
                modified_lines.append(line)

        return '\n'.join(modified_lines)

    def _generate_opaque_predicate(self, pred_type: PredicateType) -> str:
        """Generate a single opaque predicate"""

        if pred_type == PredicateType.ALWAYS_TRUE:
            template = random.choice(self.ALWAYS_TRUE_PREDICATES)
        elif pred_type == PredicateType.ALWAYS_FALSE:
            template = random.choice(self.ALWAYS_FALSE_PREDICATES)
        else:  # CONTEXT_DEPENDENT
            template = random.choice(self.CONTEXT_DEPENDENT_PREDICATES)

        # Fill in template variables
        var_name = f"_opaque_var_{self.var_counter}"
        self.var_counter += 1

        predicate = template.replace('{var}', var_name)
        predicate = predicate.replace('{func}', 'main')  # Use known function
        predicate = predicate.replace('{type}', 'int')  # Use common type

        # Add variable declaration if needed - use separate declaration and condition
        if '{var}' in template:
            declaration = f"int {var_name} = {random.randint(1, 100)};"
            return f"{declaration}\n    if ({predicate})"

        return predicate

    def _generate_dead_code(self) -> str:
        """Generate realistic dead code"""

        templates = [
            """printf("Debug: Should never see this\\n");
abort();""",
            """int _dead_{rand} = {value};
_dead_{rand} *= 2;
return _dead_{rand};""",
            """// Fake error handling
fprintf(stderr, "Critical error\\n");
exit(1);""",
            """// Fake cleanup
free((void*)0xDEADBEEF);
return -1;""",
        ]

        template = random.choice(templates)
        return template.format(
            rand=random.randint(1000, 9999),
            value=random.randint(1, 100)
        )

    def get_injection_report(self) -> Dict:
        """Get report on injected predicates"""

        return {
            'total_predicates_injected': self.injected_count,
            'complexity': self.complexity,
            'predicates_per_branch': self.predicates_per_branch,
            'types_used': ['always_true', 'always_false', 'context_dependent']
        }


def main():
    """CLI interface for opaque predicate injection"""
    import argparse

    parser = argparse.ArgumentParser(
        description='Inject opaque predicates into C/C++ functions'
    )
    parser.add_argument('source_file', help='C/C++ source file')
    parser.add_argument('function_name', help='Function to protect')
    parser.add_argument(
        '--complexity',
        choices=['low', 'medium', 'high'],
        default='medium',
        help='Complexity level (default: medium)'
    )
    parser.add_argument(
        '--predicates-per-branch',
        type=int,
        default=2,
        help='Number of predicates per branch (default: 2)'
    )
    parser.add_argument(
        '--output',
        help='Output file (default: stdout)'
    )

    args = parser.parse_args()

    # Read source file
    with open(args.source_file, 'r') as f:
        content = f.read()

    # Extract function
    func_pattern = rf'(\w+[\s\*]+)?{args.function_name}\s*\([^)]*\)\s*\{{.*?\}}'
    match = re.search(func_pattern, content, re.DOTALL)

    if not match:
        print(f"Error: Function '{args.function_name}' not found")
        return

    function_code = match.group(0)

    # Inject predicates
    injector = OpaquePredicateInjector(
        complexity=args.complexity,
        predicates_per_branch=args.predicates_per_branch
    )
    protected_code = injector.inject_predicates(function_code, args.function_name)

    # Output
    if args.output:
        with open(args.output, 'w') as f:
            f.write(protected_code)
        print(f"✓ Protected function written to {args.output}")
    else:
        print(protected_code)

    # Print report
    report = injector.get_injection_report()
    print(f"\n📊 Opaque Predicate Injection Report:")
    print(f"  Total predicates injected: {report['total_predicates_injected']}")
    print(f"  Complexity: {report['complexity']}")


if __name__ == '__main__':
    main()
