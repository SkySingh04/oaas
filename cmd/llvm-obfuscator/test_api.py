#!/usr/bin/env python3
import sys
sys.path.insert(0, '/Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator')

from pathlib import Path
from core.config import ObfuscationConfig, PassConfiguration, OutputConfiguration
from core.obfuscator import LLVMObfuscator

# Test API
config = ObfuscationConfig(
    level=4,
    passes=PassConfiguration(
        flattening=True,
        substitution=True,
        bogus_control_flow=True,
        split=True
    ),
    output=OutputConfiguration(
        directory=Path("./test_api_output"),
        report_formats=["json"]
    ),
    compiler_flags=["-O1"]
)

obfuscator = LLVMObfuscator()
source = Path("../../src/factorial_recursive.c")

print(f"Testing API with source: {source}")
print(f"OLLVM passes enabled: {config.passes.enabled_passes()}")

try:
    result = obfuscator.obfuscate(source, config)
    print(f"\n✅ API Test SUCCESS!")
    print(f"Output: {result['output_file']}")
    print(f"Passes applied: {result['enabled_passes']}")
    print(f"Obfuscation score: {result['obfuscation_score']}")
except Exception as e:
    print(f"\n❌ API Test FAILED: {e}")
    import traceback
    traceback.print_exc()
