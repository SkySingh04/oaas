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

# Helper to strip debug symbols from newly built targets.
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
        set(VERIFY_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/../../cmake/VerifyNoDebug.cmake")
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

# Build the pass as a shared library
add_library(SimpleObfuscator MODULE SimpleObfuscator.cpp)

# Link against LLVM
target_link_libraries(SimpleObfuscator PRIVATE ${LLVM_AVAILABLE_LIBS})

strip_and_verify(SimpleObfuscator)

# Platform-specific settings
if(APPLE)
    set_target_properties(SimpleObfuscator PROPERTIES
        LINK_FLAGS "-undefined dynamic_lookup"
        SUFFIX ".dylib"
    )
endif()

# --- LinearMBA pass (new PM plugin) ---
# Build the LinearMBA pass plugin alongside the existing SimpleObfuscator.
# We reference the implementation placed one directory up to avoid duplication.
add_library(LinearMBA MODULE ../linearMBA.cpp)
target_link_libraries(LinearMBA PRIVATE ${LLVM_AVAILABLE_LIBS})

if(APPLE)
    set_target_properties(LinearMBA PROPERTIES
        LINK_FLAGS "-undefined dynamic_lookup"
        SUFFIX ".dylib"
    )
endif()
