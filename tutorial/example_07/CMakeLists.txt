cmake_minimum_required (VERSION 2.6)
project (Tutorial)
# The version number.
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

message("DEBUG : PROJECT_SOURCE_DIR = ${PROJECT_SOURCE_DIR}")
message("DEBUG : PROJECT_BINARY_DIR = ${PROJECT_BINARY_DIR}")

# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
include_directories("${PROJECT_BINARY_DIR}")

# should we use our own math functions?
option (USE_MYMATH 
        "Use tutorial provided math implementation" ON) 
 
message("DEBUG : USE_MYMATH = ${USE_MYMATH}")

# https://stackoverflow.com/questions/50220242/cmake-check-function-exists-doesnt

# # does this system provide the log and exp functions?
# include (CheckFunctionExists)
# check_function_exists (sqrt HAVE_LOG)
# check_function_exists (exp HAVE_EXP)

# does this system provide the log and exp functions?
include (CheckCXXSymbolExists)
check_cxx_symbol_exists (log cmath HAVE_LOG)
check_cxx_symbol_exists (exp cmath HAVE_EXP)

message("DEBUG : HAVE_LOG = ${HAVE_LOG}")
message("DEBUG : HAVE_EXP = ${HAVE_EXP}")


# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
  "${PROJECT_BINARY_DIR}/TutorialConfig.h"
  )
 
# add the MathFunctions library?
#
if (USE_MYMATH)
  include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")
  add_subdirectory (MathFunctions)
  set (EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
endif (USE_MYMATH)
 
# add the executable
add_executable (Tutorial tutorial.cxx)
target_link_libraries (Tutorial  ${EXTRA_LIBS})

include(CTest)

#define a macro to simplify adding tests, then use it
macro (do_test arg result)
  add_test (TutorialComp${arg} Tutorial ${arg})
  set_tests_properties (TutorialComp${arg}
    PROPERTIES PASS_REGULAR_EXPRESSION ${result})
endmacro (do_test)
 
# do a bunch of result based tests
do_test (25 "25 is 5")
do_test (-25 "-25 is nan")
do_test (0.0001 "0.0001 is 0.01")
