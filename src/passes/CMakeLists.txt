cmake_minimum_required(VERSION 3.13.4)
project(SimpleObfuscator)

# Find LLVM
find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# Set C++ standard
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include LLVM headers
include_directories(${LLVM_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})

# Build the pass as a shared library
add_library(SimpleObfuscator MODULE SimpleObfuscator.cpp)

# Link against LLVM
target_link_libraries(SimpleObfuscator PRIVATE ${LLVM_AVAILABLE_LIBS})

# Platform-specific settings
if(APPLE)
    set_target_properties(SimpleObfuscator PROPERTIES
        LINK_FLAGS "-undefined dynamic_lookup"
        SUFFIX ".dylib"
    )
endif()
