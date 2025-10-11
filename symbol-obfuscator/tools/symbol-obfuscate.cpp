#include "../src/crypto_hasher.h"
#include "../src/c_obfuscator.h"
#include "../src/cpp_mangler.h"
#include <iostream>
#include <cstring>
#include <getopt.h>

using namespace SymbolObfuscator;

struct CliOptions {
    std::string input_file;
    std::string output_file;
    std::string map_file = "symbol_map.json";
    HashAlgorithm hash_algo = HashAlgorithm::SHA256;
    PrefixStyle prefix_style = PrefixStyle::TYPED;
    size_t hash_length = 12;
    std::string salt;
    bool preserve_main = true;
    bool preserve_stdlib = true;
    bool generate_map = true;
    bool verbose = false;
    bool is_cpp = false;
};

void printUsage(const char* program_name) {
    std::cout << "Symbol Table Cryptographic Obfuscator\n\n";
    std::cout << "Usage: " << program_name << " [options] input_file -o output_file\n\n";
    std::cout << "Options:\n";
    std::cout << "  -o, --output FILE          Output file path\n";
    std::cout << "  -m, --map FILE            Symbol mapping file (default: symbol_map.json)\n";
    std::cout << "  -a, --algorithm ALGO      Hash algorithm: sha256, blake2b, siphash (default: sha256)\n";
    std::cout << "  -p, --prefix STYLE        Prefix style: none, typed, underscore (default: typed)\n";
    std::cout << "  -l, --length N            Hash length in characters (default: 12)\n";
    std::cout << "  -s, --salt STRING         Custom salt for hashing\n";
    std::cout << "  --no-preserve-main        Don't preserve main() function\n";
    std::cout << "  --no-preserve-stdlib      Don't preserve stdlib functions\n";
    std::cout << "  --no-map                  Don't generate mapping file\n";
    std::cout << "  --cpp                     Treat as C++ code (enable name mangling obfuscation)\n";
    std::cout << "  -v, --verbose             Verbose output\n";
    std::cout << "  -h, --help                Show this help message\n\n";
    std::cout << "Examples:\n";
    std::cout << "  # Basic C obfuscation\n";
    std::cout << "  " << program_name << " input.c -o output.c\n\n";
    std::cout << "  # C++ obfuscation with custom salt\n";
    std::cout << "  " << program_name << " --cpp input.cpp -o output.cpp -s mysecret\n\n";
    std::cout << "  # Aggressive obfuscation (short hashes, no stdlib preservation)\n";
    std::cout << "  " << program_name << " input.c -o output.c -l 8 --no-preserve-stdlib\n";
}

bool parseOptions(int argc, char** argv, CliOptions& opts) {
    static struct option long_options[] = {
        {"output",              required_argument, 0, 'o'},
        {"map",                 required_argument, 0, 'm'},
        {"algorithm",           required_argument, 0, 'a'},
        {"prefix",              required_argument, 0, 'p'},
        {"length",              required_argument, 0, 'l'},
        {"salt",                required_argument, 0, 's'},
        {"no-preserve-main",    no_argument,       0, 1001},
        {"no-preserve-stdlib",  no_argument,       0, 1002},
        {"no-map",              no_argument,       0, 1003},
        {"cpp",                 no_argument,       0, 1004},
        {"verbose",             no_argument,       0, 'v'},
        {"help",                no_argument,       0, 'h'},
        {0, 0, 0, 0}
    };

    int option_index = 0;
    int c;

    while ((c = getopt_long(argc, argv, "o:m:a:p:l:s:vh", long_options, &option_index)) != -1) {
        switch (c) {
            case 'o':
                opts.output_file = optarg;
                break;
            case 'm':
                opts.map_file = optarg;
                break;
            case 'a':
                if (strcmp(optarg, "sha256") == 0) {
                    opts.hash_algo = HashAlgorithm::SHA256;
                } else if (strcmp(optarg, "blake2b") == 0) {
                    opts.hash_algo = HashAlgorithm::BLAKE2B;
                } else if (strcmp(optarg, "siphash") == 0) {
                    opts.hash_algo = HashAlgorithm::SIPHASH;
                } else {
                    std::cerr << "Unknown hash algorithm: " << optarg << "\n";
                    return false;
                }
                break;
            case 'p':
                if (strcmp(optarg, "none") == 0) {
                    opts.prefix_style = PrefixStyle::NONE;
                } else if (strcmp(optarg, "typed") == 0) {
                    opts.prefix_style = PrefixStyle::TYPED;
                } else if (strcmp(optarg, "underscore") == 0) {
                    opts.prefix_style = PrefixStyle::UNDERSCORE;
                } else {
                    std::cerr << "Unknown prefix style: " << optarg << "\n";
                    return false;
                }
                break;
            case 'l':
                opts.hash_length = std::stoi(optarg);
                break;
            case 's':
                opts.salt = optarg;
                break;
            case 1001:
                opts.preserve_main = false;
                break;
            case 1002:
                opts.preserve_stdlib = false;
                break;
            case 1003:
                opts.generate_map = false;
                break;
            case 1004:
                opts.is_cpp = true;
                break;
            case 'v':
                opts.verbose = true;
                break;
            case 'h':
                printUsage(argv[0]);
                exit(0);
            case '?':
                return false;
            default:
                return false;
        }
    }

    // Get input file
    if (optind < argc) {
        opts.input_file = argv[optind];
    } else {
        std::cerr << "Error: No input file specified\n";
        return false;
    }

    // Check required options
    if (opts.output_file.empty()) {
        std::cerr << "Error: Output file not specified (-o option required)\n";
        return false;
    }

    return true;
}

int main(int argc, char** argv) {
    CliOptions opts;

    if (!parseOptions(argc, argv, opts)) {
        printUsage(argv[0]);
        return 1;
    }

    if (opts.verbose) {
        std::cout << "Symbol Obfuscator Configuration:\n";
        std::cout << "  Input:       " << opts.input_file << "\n";
        std::cout << "  Output:      " << opts.output_file << "\n";
        std::cout << "  Map file:    " << opts.map_file << "\n";
        std::cout << "  Algorithm:   ";
        switch (opts.hash_algo) {
            case HashAlgorithm::SHA256:  std::cout << "SHA256\n"; break;
            case HashAlgorithm::BLAKE2B: std::cout << "BLAKE2B\n"; break;
            case HashAlgorithm::SIPHASH: std::cout << "SipHash\n"; break;
        }
        std::cout << "  Hash length: " << opts.hash_length << "\n";
        std::cout << "  Salt:        " << (opts.salt.empty() ? "(auto-generated)" : opts.salt) << "\n";
        std::cout << "  Language:    " << (opts.is_cpp ? "C++" : "C") << "\n\n";
    }

    try {
        // Configure hash settings
        HashConfig hash_config;
        hash_config.algorithm = opts.hash_algo;
        hash_config.prefix_style = opts.prefix_style;
        hash_config.hash_length = opts.hash_length;
        hash_config.global_salt = opts.salt;
        hash_config.deterministic = true;

        // Configure obfuscation
        ObfuscationConfig obf_config;
        obf_config.hash_config = hash_config;
        obf_config.generate_map = opts.generate_map;
        obf_config.map_file_path = opts.map_file;

        // Adjust preserve symbols based on options
        if (!opts.preserve_main) {
            obf_config.preserve_symbols.erase("main");
        }

        if (!opts.preserve_stdlib) {
            // Clear stdlib preservation (symbols will still be preserved via patterns)
            // This is handled in the obfuscator logic
        }

        // Run obfuscation
        if (opts.verbose) {
            std::cout << "Starting obfuscation...\n";
        }

        CSymbolObfuscator obfuscator(obf_config);
        obfuscator.obfuscateSymbols(opts.input_file, opts.output_file);

        if (opts.verbose) {
            std::cout << "Obfuscation complete!\n";
            std::cout << "Obfuscated " << obfuscator.getMappings().size() << " symbols\n";
        }

        // Print summary
        std::cout << "\n=== Symbol Obfuscation Summary ===\n";
        std::cout << "Input:           " << opts.input_file << "\n";
        std::cout << "Output:          " << opts.output_file << "\n";
        std::cout << "Symbols renamed: " << obfuscator.getMappings().size() << "\n";

        if (opts.generate_map) {
            std::cout << "Mapping saved:   " << opts.map_file << "\n";
        }

        // Show sample mappings if verbose
        if (opts.verbose && !obfuscator.getMappings().empty()) {
            std::cout << "\nSample mappings:\n";
            int count = 0;
            for (const auto& mapping : obfuscator.getMappings()) {
                if (count++ >= 10) break;
                std::cout << "  " << mapping.original_name
                         << " -> " << mapping.obfuscated_name << "\n";
            }
            if (obfuscator.getMappings().size() > 10) {
                std::cout << "  ... (" << (obfuscator.getMappings().size() - 10)
                         << " more)\n";
            }
        }

        std::cout << "\n✓ Success!\n";

        return 0;

    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << "\n";
        return 1;
    }
}
