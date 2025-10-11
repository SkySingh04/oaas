# Verify that a binary has no remaining debug sections.
# Expected variables:
#   READOBJ_COMMAND - executable capable of listing sections (llvm-readobj/readelf)
#   ARTIFACT        - path to the binary to inspect

if(NOT DEFINED READOBJ_COMMAND OR READOBJ_COMMAND STREQUAL "")
  message(FATAL_ERROR "READOBJ_COMMAND is not defined; cannot verify debug symbols")
endif()

if(NOT DEFINED ARTIFACT OR ARTIFACT STREQUAL "")
  message(FATAL_ERROR "ARTIFACT is not defined; cannot verify debug symbols")
endif()

execute_process(
  COMMAND "${READOBJ_COMMAND}" --sections "${ARTIFACT}"
  OUTPUT_VARIABLE _sections
  ERROR_VARIABLE _readobj_err
  RESULT_VARIABLE _readobj_status
)

if(NOT _readobj_status EQUAL 0)
  message(FATAL_ERROR "Failed to inspect ${ARTIFACT}: ${_readobj_err}")
endif()

string(FIND "${_sections}" ".debug" _debug_index)

if(NOT _debug_index EQUAL -1)
  message(FATAL_ERROR "Debug sections detected in ${ARTIFACT}; stripping failed")
endif()
