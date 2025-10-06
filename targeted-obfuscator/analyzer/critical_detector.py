#!/usr/bin/env python3
"""
Critical Function Detector
Identifies functions in C/C++ code that need protection based on patterns and context.
"""

import re
import json
from pathlib import Path
from typing import Dict, List, Set, Tuple
from dataclasses import dataclass, asdict
from enum import Enum


class CriticalityLevel(Enum):
    """Criticality levels for functions"""
    LOW = 1
    MEDIUM = 2
    HIGH = 3
    MAXIMUM = 4


@dataclass
class FunctionInfo:
    """Information about a detected function"""
    name: str
    file_path: str
    line_number: int
    criticality: CriticalityLevel
    category: str
    reasons: List[str]
    dependencies: List[str]
    recommended_protections: List[str]

    def to_dict(self):
        d = asdict(self)
        d['criticality'] = self.criticality.name.lower()
        return d


class CriticalFunctionDetector:
    """Identify functions that need protection"""

    # Patterns that suggest critical functions
    CRITICAL_PATTERNS = {
        'license': {
            'patterns': [
                r'check_license', r'validate_key', r'verify_license',
                r'license_valid', r'validate_serial', r'check_activation',
                r'verify_registration', r'validate_product_key'
            ],
            'criticality': CriticalityLevel.MAXIMUM,
            'protections': ['string_encryption', 'cfg_flattening', 'opaque_predicates', 'vm']
        },
        'crypto': {
            'patterns': [
                r'encrypt', r'decrypt', r'hash', r'sign', r'verify',
                r'aes_', r'rsa_', r'sha\d+', r'md5', r'hmac',
                r'cipher', r'key_derive'
            ],
            'criticality': CriticalityLevel.HIGH,
            'protections': ['string_encryption', 'cfg_flattening', 'opaque_predicates']
        },
        'auth': {
            'patterns': [
                r'authenticate', r'check_password', r'validate_user',
                r'verify_credentials', r'login', r'check_auth',
                r'verify_token', r'validate_session'
            ],
            'criticality': CriticalityLevel.HIGH,
            'protections': ['string_encryption', 'cfg_flattening', 'opaque_predicates']
        },
        'ip': {
            'patterns': [
                r'proprietary', r'algorithm', r'secret', r'core_logic',
                r'internal_', r'private_algo', r'trade_secret'
            ],
            'criticality': CriticalityLevel.MAXIMUM,
            'protections': ['string_encryption', 'cfg_flattening', 'opaque_predicates', 'vm']
        },
        'drm': {
            'patterns': [
                r'check_expiry', r'validate_subscription', r'check_permission',
                r'verify_drm', r'check_rights', r'validate_access',
                r'check_entitlement'
            ],
            'criticality': CriticalityLevel.HIGH,
            'protections': ['string_encryption', 'cfg_flattening', 'opaque_predicates']
        },
        'anti_debug': {
            'patterns': [
                r'detect_debugger', r'anti_debug', r'check_debug',
                r'is_debugged', r'detect_trace', r'anti_tamper'
            ],
            'criticality': CriticalityLevel.MEDIUM,
            'protections': ['cfg_flattening', 'opaque_predicates']
        }
    }

    # Sensitive string patterns in function bodies
    SENSITIVE_STRING_PATTERNS = [
        r'"[A-Z0-9]{4,}-[A-Z0-9]{4,}"',  # License keys (XXXX-YYYY format)
        r'"[A-Za-z0-9+/]{32,}={0,2}"',   # Base64 encoded data
        r'"(?:password|secret|key|token)[:=]',  # Credential strings
        r'0x[0-9a-fA-F]{8,}',  # Long hex constants (potential keys)
    ]

    def __init__(self, max_functions: int = 5):
        """Initialize detector with max functions to return"""
        self.max_functions = max_functions
        self.detected_functions: List[FunctionInfo] = []

    def analyze_source(self, source_file: str) -> List[FunctionInfo]:
        """
        Analyze C/C++ source file and identify critical functions

        Args:
            source_file: Path to C/C++ source file

        Returns:
            List of FunctionInfo objects, sorted by criticality
        """
        source_path = Path(source_file)
        if not source_path.exists():
            raise FileNotFoundError(f"Source file not found: {source_file}")

        with open(source_path, 'r') as f:
            content = f.read()

        # Extract functions
        functions = self._extract_functions(content, str(source_path))

        # Analyze each function
        for func_name, func_body, line_num in functions:
            func_info = self._analyze_function(
                func_name, func_body, str(source_path), line_num
            )
            if func_info:
                self.detected_functions.append(func_info)

        # Sort by criticality and return top N
        self.detected_functions.sort(
            key=lambda f: f.criticality.value,
            reverse=True
        )

        return self.detected_functions[:self.max_functions]

    def _extract_functions(self, content: str, file_path: str) -> List[Tuple[str, str, int]]:
        """
        Extract function definitions from C/C++ code
        Returns list of (name, body, line_number) tuples
        """
        functions = []

        # Simple regex-based function extraction
        # Pattern: return_type function_name(params) { body }
        # This is simplified - production would use clang AST

        # Find function signatures
        func_pattern = r'(\w+[\s\*]+)?(\w+)\s*\([^)]*\)\s*\{'

        lines = content.split('\n')
        i = 0
        while i < len(lines):
            match = re.search(func_pattern, lines[i])
            if match:
                func_name = match.group(2)

                # Skip common keywords that aren't functions
                if func_name in ['if', 'while', 'for', 'switch', 'catch']:
                    i += 1
                    continue

                # Extract function body
                line_num = i + 1
                brace_count = 1
                func_body = lines[i]
                i += 1

                while i < len(lines) and brace_count > 0:
                    func_body += '\n' + lines[i]
                    brace_count += lines[i].count('{')
                    brace_count -= lines[i].count('}')
                    i += 1

                functions.append((func_name, func_body, line_num))
            else:
                i += 1

        return functions

    def _analyze_function(
        self,
        func_name: str,
        func_body: str,
        file_path: str,
        line_number: int
    ) -> FunctionInfo:
        """
        Analyze a single function to determine if it's critical

        Returns FunctionInfo if critical, None otherwise
        """
        reasons = []
        category = 'unknown'
        criticality = CriticalityLevel.LOW
        protections = []

        # Check name patterns
        for cat, info in self.CRITICAL_PATTERNS.items():
            for pattern in info['patterns']:
                if re.search(pattern, func_name, re.IGNORECASE):
                    reasons.append(f"Function name matches {cat} pattern: {pattern}")
                    category = cat
                    criticality = max(criticality, info['criticality'], key=lambda x: x.value)
                    protections.extend(info['protections'])

        # Check for sensitive strings in body
        for pattern in self.SENSITIVE_STRING_PATTERNS:
            matches = re.findall(pattern, func_body)
            if matches:
                reasons.append(f"Contains sensitive data pattern: {pattern[:30]}...")
                criticality = max(criticality, CriticalityLevel.HIGH, key=lambda x: x.value)
                if 'string_encryption' not in protections:
                    protections.append('string_encryption')

        # Check for comparison operations (often in validation)
        if re.search(r'strcmp|strncmp|memcmp|==.*["0-9]', func_body):
            reasons.append("Contains comparison operations (potential validation)")
            criticality = max(criticality, CriticalityLevel.MEDIUM, key=lambda x: x.value)

        # Check for return value checks (success/failure)
        if re.search(r'return\s+[01];', func_body):
            reasons.append("Returns boolean status (validation function)")

        # Only return if function has some criticality
        if criticality.value > CriticalityLevel.LOW.value or reasons:
            # Find dependencies (functions called)
            dependencies = self._extract_dependencies(func_body)

            # Remove duplicates from protections
            protections = list(dict.fromkeys(protections))

            return FunctionInfo(
                name=func_name,
                file_path=file_path,
                line_number=line_number,
                criticality=criticality,
                category=category,
                reasons=reasons,
                dependencies=dependencies,
                recommended_protections=protections
            )

        return None

    def _extract_dependencies(self, func_body: str) -> List[str]:
        """Extract function calls from function body"""
        # Find function calls: identifier followed by (
        calls = re.findall(r'\b([a-zA-Z_]\w*)\s*\(', func_body)

        # Filter out common keywords and duplicates
        keywords = {'if', 'while', 'for', 'switch', 'return', 'sizeof', 'printf'}
        dependencies = [c for c in calls if c not in keywords]

        return list(dict.fromkeys(dependencies))  # Remove duplicates

    def generate_protection_map(self, functions: List[FunctionInfo]) -> Dict:
        """
        Create a map of which protections to apply to which functions

        Returns:
            Dictionary mapping function names to protection configs
        """
        protection_map = {}

        for func in functions:
            protection_map[func.name] = {
                'file': func.file_path,
                'line': func.line_number,
                'criticality': func.criticality.name.lower(),
                'category': func.category,
                'reasons': func.reasons,
                'recommended_protections': func.recommended_protections,
                'dependencies': func.dependencies
            }

        return protection_map

    def export_to_yaml(self, functions: List[FunctionInfo], output_file: str):
        """Export detected critical functions to YAML config format"""
        import yaml

        config = {
            'critical_functions': [
                {
                    'name': f.name,
                    'file': f.file_path,
                    'protection_level': f.criticality.name.lower(),
                    'category': f.category,
                    'reasons': f.reasons,
                    'recommended_layers': f.recommended_protections,
                    'dependencies': f.dependencies
                }
                for f in functions
            ]
        }

        with open(output_file, 'w') as f:
            yaml.dump(config, f, default_flow_style=False, sort_keys=False)

    def export_to_json(self, functions: List[FunctionInfo], output_file: str):
        """Export detected critical functions to JSON format"""
        data = {
            'critical_functions': [f.to_dict() for f in functions],
            'summary': {
                'total_functions': len(functions),
                'by_criticality': {
                    level.name.lower(): sum(
                        1 for f in functions if f.criticality == level
                    )
                    for level in CriticalityLevel
                }
            }
        }

        with open(output_file, 'w') as f:
            json.dump(data, f, indent=2)


def main():
    """CLI interface for critical function detection"""
    import argparse

    parser = argparse.ArgumentParser(
        description='Detect critical functions in C/C++ code'
    )
    parser.add_argument('source_file', help='C/C++ source file to analyze')
    parser.add_argument(
        '--max-functions',
        type=int,
        default=5,
        help='Maximum number of functions to return (default: 5)'
    )
    parser.add_argument(
        '--output',
        help='Output file for results (YAML or JSON based on extension)'
    )
    parser.add_argument(
        '--format',
        choices=['yaml', 'json', 'text'],
        default='text',
        help='Output format (default: text)'
    )

    args = parser.parse_args()

    # Detect critical functions
    detector = CriticalFunctionDetector(max_functions=args.max_functions)
    functions = detector.analyze_source(args.source_file)

    # Output results
    if args.output:
        if args.format == 'yaml' or args.output.endswith('.yaml'):
            detector.export_to_yaml(functions, args.output)
            print(f"✓ Critical functions exported to {args.output}")
        elif args.format == 'json' or args.output.endswith('.json'):
            detector.export_to_json(functions, args.output)
            print(f"✓ Critical functions exported to {args.output}")
    else:
        # Print to console
        print(f"\n🔍 Detected {len(functions)} critical function(s) in {args.source_file}:\n")

        for i, func in enumerate(functions, 1):
            print(f"{i}. {func.name}() - {func.criticality.name} criticality")
            print(f"   File: {func.file_path}:{func.line_number}")
            print(f"   Category: {func.category}")
            print(f"   Reasons:")
            for reason in func.reasons:
                print(f"     - {reason}")
            print(f"   Recommended protections: {', '.join(func.recommended_protections)}")
            if func.dependencies:
                print(f"   Dependencies: {', '.join(func.dependencies[:5])}")
            print()


if __name__ == '__main__':
    main()
