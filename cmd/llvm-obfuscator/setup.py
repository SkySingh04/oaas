#!/usr/bin/env python3
"""
LLVM Binary Obfuscator - Setup Script
Production-ready LLVM binary obfuscation tool with 4-layer protection
"""

from setuptools import setup, find_packages
from pathlib import Path

# Read README
readme_file = Path(__file__).parent / "README.md"
long_description = readme_file.read_text() if readme_file.exists() else ""

# Read requirements
requirements_file = Path(__file__).parent / "requirements.txt"
requirements = []
if requirements_file.exists():
    requirements = [
        line.strip()
        for line in requirements_file.read_text().splitlines()
        if line.strip() and not line.startswith('#')
    ]

setup(
    name="llvm-obfuscator",
    version="1.0.0",
    description="Production-ready LLVM binary obfuscation tool with 4-layer protection",
    long_description=long_description,
    long_description_content_type="text/markdown",
    author="LLVM Obfuscation Team",
    author_email="obfuscation@example.com",
    url="https://github.com/yourorg/llvm-obfuscator",
    license="Apache-2.0",

    # Package discovery
    packages=find_packages(where="."),
    package_dir={"": "."},

    # Include non-Python files
    include_package_data=True,
    package_data={
        "": [
            "plugins/darwin-arm64/*.dylib",
            "plugins/darwin-x86_64/*.dylib",
            "plugins/linux-x86_64/*.so",
            "plugins/windows-x86_64/*.dll",
            "plugins/LICENSE",
            "plugins/NOTICE",
        ],
    },

    # Dependencies
    install_requires=requirements,

    # Python version
    python_requires=">=3.9",

    # Entry points
    entry_points={
        "console_scripts": [
            "llvm-obfuscate=cli.obfuscate:app",
        ],
    },

    # Classifiers
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "Topic :: Security",
        "Topic :: Software Development :: Build Tools",
        "License :: OSI Approved :: Apache Software License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
        "Operating System :: OS Independent",
    ],

    # Keywords
    keywords="llvm obfuscation binary-protection code-protection compiler security",

    # Project URLs
    project_urls={
        "Documentation": "https://github.com/yourorg/llvm-obfuscator/docs",
        "Source": "https://github.com/yourorg/llvm-obfuscator",
        "Tracker": "https://github.com/yourorg/llvm-obfuscator/issues",
    },
)
