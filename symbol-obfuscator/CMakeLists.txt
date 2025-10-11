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

# Helper to strip debug information from build artifacts.
function(strip_and_verify target)
    if(NOT TARGET ${target})
        message(FATAL_ERROR "Target ${target} not defined")
    endif()

    if(NOT DEFINED STRIP_COMMAND)
        set(STRIP_COMMAND "")
        set(STRIP_ARGS "")

        if(DEFINED LLVM_TOOLS_BINARY_DIR)
            find_program(LLVM_OBJCOPY_TOOL NAMES llvm-objcopy HINTS ${LLVM_TOOLS_BINARY_DIR})
            find_program(LLVM_STRIP_TOOL NAMES llvm-strip HINTS ${LLVM_TOOLS_BINARY_DIR})
        endif()

        if(LLVM_OBJCOPY_TOOL)
            set(STRIP_COMMAND ${LLVM_OBJCOPY_TOOL})
            set(STRIP_ARGS --strip-debug)
        elseif(LLVM_STRIP_TOOL)
            set(STRIP_COMMAND ${LLVM_STRIP_TOOL})
            set(STRIP_ARGS --strip-debug)
        else()
            find_program(SYSTEM_STRIP_TOOL strip)
            if(SYSTEM_STRIP_TOOL)
                set(STRIP_COMMAND ${SYSTEM_STRIP_TOOL})
                if(APPLE)
                    # On macOS --strip-debug is not supported; -S removes debug data.
                    set(STRIP_ARGS -S)
                else()
                    set(STRIP_ARGS --strip-debug)
                endif()
            endif()
        endif()

        if(STRIP_COMMAND)
            set(STRIP_COMMAND ${STRIP_COMMAND} CACHE INTERNAL "strip tool" FORCE)
            set(STRIP_ARGS ${STRIP_ARGS} CACHE INTERNAL "strip arguments" FORCE)
        else()
            message(WARNING "No strip tool found; debug symbols may remain in ${target}")
        endif()
    endif()

    if(STRIP_COMMAND)
        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND ${STRIP_COMMAND} ${STRIP_ARGS} "$<TARGET_FILE:${target}>"
            COMMENT "Stripping debug symbols from $<TARGET_FILE:${target}>"
        )
    endif()

    if(NOT DEFINED READOBJ_COMMAND)
        if(DEFINED LLVM_TOOLS_BINARY_DIR)
            find_program(LLVM_READOBJ_TOOL NAMES llvm-readobj llvm-readelf HINTS ${LLVM_TOOLS_BINARY_DIR})
        endif()
        if(NOT LLVM_READOBJ_TOOL)
            find_program(SYSTEM_READOBJ_TOOL NAMES readelf)
        endif()

        if(LLVM_READOBJ_TOOL)
            set(READOBJ_COMMAND ${LLVM_READOBJ_TOOL} CACHE INTERNAL "readobj tool" FORCE)
        elseif(SYSTEM_READOBJ_TOOL)
            set(READOBJ_COMMAND ${SYSTEM_READOBJ_TOOL} CACHE INTERNAL "readobj tool" FORCE)
        endif()

        if(NOT DEFINED READOBJ_COMMAND)
            message(WARNING "No readobj/readelf tool found; skipping debug section verification for ${target}")
        endif()
    endif()

    if(DEFINED READOBJ_COMMAND)
        set(VERIFY_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/../cmake/VerifyNoDebug.cmake")
        if(EXISTS "${VERIFY_SCRIPT}")
            add_custom_command(TARGET ${target} POST_BUILD
                COMMAND ${CMAKE_COMMAND}
                    -DREADOBJ_COMMAND=${READOBJ_COMMAND}
                    -DARTIFACT=$<TARGET_FILE:${target}>
                    -P ${VERIFY_SCRIPT}
                COMMENT "Verifying $<TARGET_FILE:${target}> for stray debug sections"
            )
        else()
            message(WARNING "Verification script not found at ${VERIFY_SCRIPT}; skipping debug check for ${target}")
        endif()
    endif()
endfunction()

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
strip_and_verify(SymbolObfuscationPass)

# Build standalone tool
add_executable(symbol-obfuscate
    tools/symbol-obfuscate.cpp
)

target_link_libraries(symbol-obfuscate
    SymbolObfuscatorCore
    ${OPENSSL_CRYPTO_LIBRARY}
    ${JSONCPP_LIBRARY}
)
strip_and_verify(symbol-obfuscate)

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
