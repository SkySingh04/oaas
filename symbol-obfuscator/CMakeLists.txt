cmake_minimum_required(VERSION 3.13.4)
project(SymbolObfuscator)

# Find LLVM
find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# LLVM definitions and includes
include_directories(${LLVM_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})

# Find OpenSSL for crypto functions
find_package(OpenSSL REQUIRED)
include_directories(${OPENSSL_INCLUDE_DIR})

# Find jsoncpp for JSON serialization
find_package(PkgConfig REQUIRED)
pkg_check_modules(JSONCPP jsoncpp)
if(JSONCPP_FOUND)
    include_directories(${JSONCPP_INCLUDE_DIRS})
    link_directories(${JSONCPP_LIBRARY_DIRS})
    set(JSONCPP_LIBRARY ${JSONCPP_LIBRARIES})
else()
    # Fallback: try to find it manually
    find_path(JSONCPP_INCLUDE_DIR json/json.h
        PATHS /usr/include/jsoncpp /usr/local/include/jsoncpp /opt/homebrew/include)
    find_library(JSONCPP_LIBRARY jsoncpp
        PATHS /usr/lib /usr/local/lib /opt/homebrew/lib)
    include_directories(${JSONCPP_INCLUDE_DIR})
endif()

# Core library sources
set(CORE_SOURCES
    src/crypto_hasher.cpp
    src/c_obfuscator.cpp
    src/cpp_mangler.cpp
)

# Build core library
add_library(SymbolObfuscatorCore STATIC ${CORE_SOURCES})
target_link_libraries(SymbolObfuscatorCore
    ${OPENSSL_CRYPTO_LIBRARY}
    ${JSONCPP_LIBRARY}
)

# Build LLVM pass plugin
add_library(SymbolObfuscationPass MODULE
    passes/SymbolObfuscationPass.cpp
    ${CORE_SOURCES}
)

target_link_libraries(SymbolObfuscationPass
    ${OPENSSL_CRYPTO_LIBRARY}
    ${JSONCPP_LIBRARY}
)

# Don't add LLVM prefix to plugin
set_target_properties(SymbolObfuscationPass PROPERTIES PREFIX "")

# Build standalone tool
add_executable(symbol-obfuscate
    tools/symbol-obfuscate.cpp
)

target_link_libraries(symbol-obfuscate
    SymbolObfuscatorCore
    ${OPENSSL_CRYPTO_LIBRARY}
    ${JSONCPP_LIBRARY}
)

# Installation
install(TARGETS SymbolObfuscatorCore symbol-obfuscate SymbolObfuscationPass
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)

install(FILES
    src/crypto_hasher.h
    src/c_obfuscator.h
    src/cpp_mangler.h
    DESTINATION include/symbol-obfuscator
)

# Testing
enable_testing()

# Example: add_test(NAME test_basic COMMAND test_basic)
