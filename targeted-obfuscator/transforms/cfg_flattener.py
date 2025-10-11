#!/usr/bin/env python3
"""
Control Flow Flattening Layer (Layer 2)
Converts function control flow into a state machine dispatcher
"""

import re
import random
from typing import List, Dict, Tuple
from dataclasses import dataclass


@dataclass
class BasicBlock:
    """Represents a basic block in the control flow"""
    id: int
    code: str
    next_state: int
    is_conditional: bool
    true_state: int = -1
    false_state: int = -1
    is_fake: bool = False


class FunctionCFGFlattener:
    """Second layer - flatten control flow of specific function"""

    def __init__(self, num_fake_states: int = 5):
        """
        Initialize flattener

        Args:
            num_fake_states: Number of fake unreachable states to add
        """
        self.num_fake_states = num_fake_states
        self.blocks: List[BasicBlock] = []
        self.next_block_id = 0

    def flatten_function(self, function_code: str, function_name: str) -> str:
        """
        Flatten control flow of a function into state machine

        Args:
            function_code: The function's source code
            function_name: Name of the function

        Returns:
            Modified function code with flattened control flow
        """
        self.blocks = []
        self.next_block_id = 0

        # Step 1: Extract function signature and body
        signature, body, return_type = self._extract_function_parts(function_code, function_name)

        # Step 2: Split body into basic blocks
        self._split_into_blocks(body)

        # Step 3: Add fake blocks
        self._add_fake_blocks()

        # Step 4: Generate flattened code
        flattened = self._generate_flattened_code(signature, return_type)

        return flattened

    def _extract_function_parts(self, code: str, func_name: str) -> Tuple[str, str, str]:
        """Extract function signature and body"""

        # Match function definition
        pattern = r'((\w+[\s\*]+)' + re.escape(func_name) + r'\s*\([^)]*\))\s*\{(.*)\}'
        match = re.search(pattern, code, re.DOTALL)

        if not match:
            raise ValueError(f"Could not parse function '{func_name}'")

        signature = match.group(1)
        body = match.group(3)
        return_type = match.group(2).strip()

        return signature, body, return_type

    def _split_into_blocks(self, body: str) -> None:
        """
        Split function body into basic blocks
        This is simplified - production would use proper CFG analysis
        """

        # Split by control flow keywords (if, else, while, for, return)
        lines = body.strip().split('\n')

        current_block_code = []
        current_is_conditional = False

        for line in lines:
            stripped = line.strip()

            # Check if this is a control flow statement
            if any(keyword in stripped for keyword in ['if ', 'else', 'while ', 'for ', 'return']):
                # Save current block if it has content
                if current_block_code:
                    self._add_block(
                        code='\n'.join(current_block_code),
                        is_conditional=current_is_conditional
                    )
                    current_block_code = []

                # Start new block with this control flow
                current_block_code = [line]

                # Check if conditional
                if any(kw in stripped for kw in ['if ', 'while ', 'for ']):
                    current_is_conditional = True
                else:
                    current_is_conditional = False
            else:
                current_block_code.append(line)

        # Add final block
        if current_block_code:
            self._add_block(
                code='\n'.join(current_block_code),
                is_conditional=current_is_conditional
            )

    def _add_block(self, code: str, is_conditional: bool) -> None:
        """Add a basic block"""

        block_id = self.next_block_id
        self.next_block_id += 1

        # Determine next state(s)
        if is_conditional:
            # Conditional: needs true and false branches
            true_state = self.next_block_id
            false_state = self.next_block_id + 1
            next_state = -1
        else:
            # Sequential: go to next block
            next_state = self.next_block_id
            true_state = -1
            false_state = -1

        block = BasicBlock(
            id=block_id,
            code=code,
            next_state=next_state,
            is_conditional=is_conditional,
            true_state=true_state,
            false_state=false_state,
            is_fake=False
        )

        self.blocks.append(block)

    def _add_fake_blocks(self) -> None:
        """Add fake unreachable blocks to confuse analysis"""

        for _ in range(self.num_fake_states):
            fake_id = self.next_block_id
            self.next_block_id += 1

            # Generate fake code
            fake_code = self._generate_fake_code()

            fake_block = BasicBlock(
                id=fake_id,
                code=fake_code,
                next_state=random.randint(0, len(self.blocks)),  # Random transition
                is_conditional=False,
                is_fake=True
            )

            self.blocks.append(fake_block)

        # Shuffle blocks (except entry block)
        if len(self.blocks) > 1:
            entry = self.blocks[0]
            rest = self.blocks[1:]
            random.shuffle(rest)
            self.blocks = [entry] + rest

    def _generate_fake_code(self) -> str:
        """Generate realistic but never-executed code"""

        templates = [
            """
            // Dead code branch
            int _fake_var_{rand} = {value};
            if (_fake_var_{rand} > {impossible}) {{
                return {ret_val};
            }}
            """,
            """
            // Impossible condition - avoid referencing main function
            int _x_{rand} = {value};
            if (_x_{rand} == 0 && _x_{rand} != 0) {{
                abort();
            }}
            """,
            """
            // Always-false predicate
            volatile int _v_{rand} = {value};
            if (_v_{rand} < 0 && _v_{rand} > 0) {{
                exit(1);
            }}
            """,
        ]

        template = random.choice(templates)
        return template.format(
            rand=random.randint(1000, 9999),
            value=random.randint(1, 100),
            impossible=random.randint(1000, 9999),
            ret_val=random.choice(['0', '1', '-1'])
        )

    def _generate_flattened_code(self, signature: str, return_type: str) -> str:
        """Generate the flattened state machine code"""

        # Generate state variable initialization
        entry_code = """
    // State machine for control flow flattening
    int _state = 0;
    int _next_state = 0;
"""

        # Add return variable if needed
        if return_type and return_type != 'void':
            entry_code += f"    {return_type} _ret_val;\n"

        # Generate dispatcher loop
        dispatcher = """
    while (1) {
        switch (_state) {
"""

        # Generate case for each block
        for block in self.blocks:
            dispatcher += f"        case {block.id}:\n"

            # Add block code
            for line in block.code.split('\n'):
                if line.strip():
                    dispatcher += f"            {line}\n"

            # Add state transition logic
            if block.is_conditional:
                # Extract condition from if statement
                condition = self._extract_condition(block.code)
                if condition:
                    dispatcher += f"""
            if ({condition}) {{
                _next_state = {block.true_state};
            }} else {{
                _next_state = {block.false_state};
            }}
"""
            else:
                # Check if this is a return block
                if 'return' in block.code:
                    if return_type and return_type != 'void':
                        # Extract return value
                        ret_match = re.search(r'return\s+([^;]+);', block.code)
                        if ret_match:
                            dispatcher += f"            _ret_val = {ret_match.group(1)};\n"
                    dispatcher += "            return _ret_val;\n" if return_type and return_type != 'void' else "            return;\n"
                else:
                    dispatcher += f"            _next_state = {block.next_state};\n"

            dispatcher += "            break;\n\n"

        # Add default case (error)
        dispatcher += """        default:
            // Invalid state - should never reach here
            return _ret_val;
        }

        // Update state
        _state = _next_state;
    }

    // Should never reach here, but add fallback return
"""

        # Add return statement
        if return_type and return_type != 'void':
            dispatcher += "    return _ret_val;\n"

        dispatcher += "}\n"

        # Combine everything
        return f"{signature} {{\n{entry_code}{dispatcher}"

    def _extract_condition(self, code: str) -> str:
        """Extract condition from if/while statement"""

        # Match if (condition) or while (condition)
        match = re.search(r'(?:if|while)\s*\(([^)]+)\)', code)
        if match:
            return match.group(1)

        return ""

    def get_flattening_report(self) -> Dict:
        """Get report on control flow flattening"""

        real_blocks = [b for b in self.blocks if not b.is_fake]
        fake_blocks = [b for b in self.blocks if b.is_fake]

        return {
            'total_blocks': len(self.blocks),
            'real_blocks': len(real_blocks),
            'fake_blocks': len(fake_blocks),
            'conditional_blocks': sum(1 for b in real_blocks if b.is_conditional),
            'complexity_increase': len(self.blocks) / max(len(real_blocks), 1)
        }


def main():
    """CLI interface for CFG flattening"""
    import argparse

    parser = argparse.ArgumentParser(
        description='Flatten control flow of C/C++ functions'
    )
    parser.add_argument('source_file', help='C/C++ source file')
    parser.add_argument('function_name', help='Function to protect')
    parser.add_argument(
        '--fake-states',
        type=int,
        default=5,
        help='Number of fake states to add (default: 5)'
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

    # Flatten control flow
    flattener = FunctionCFGFlattener(num_fake_states=args.fake_states)
    flattened_code = flattener.flatten_function(function_code, args.function_name)

    # Output
    if args.output:
        with open(args.output, 'w') as f:
            f.write(flattened_code)
        print(f"✓ Flattened function written to {args.output}")
    else:
        print(flattened_code)

    # Print report
    report = flattener.get_flattening_report()
    print(f"\n📊 CFG Flattening Report:")
    print(f"  Total blocks: {report['total_blocks']}")
    print(f"  Real blocks: {report['real_blocks']}")
    print(f"  Fake blocks: {report['fake_blocks']}")
    print(f"  Complexity increase: {report['complexity_increase']:.2f}x")


if __name__ == '__main__':
    main()
