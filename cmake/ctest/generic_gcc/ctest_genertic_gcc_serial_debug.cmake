INCLUDE("${CMAKE_CURRENT_LIST_DIR}/../TribitsProjCTestDriver.cmake")

#
# Set the options specific to this build case
#

SET(COMM_TYPE SERIAL)
SET(BUILD_TYPE DEBUG)
SET(BUILD_DIR_NAME GCC_${COMM_TYPE}_${BUILD_TYPE})
SET(CTEST_TEST_TIMEOUT 60)

SET_DEFAULT_AND_FROM_ENV( CTEST_BUILD_FLAGS "-j8 -k" )

SET_DEFAULT_AND_FROM_ENV( CTEST_PARALLEL_LEVEL "8" )

SET( EXTRA_CONFIGURE_OPTIONS
  "-DBUILD_SHARED_LIBS:BOOL=ON"
  "-DCMAKE_BUILD_TYPE=DEBUG"
  "-DCMAKE_C_COMPILER=gcc"
  "-DCMAKE_CXX_COMPILER=g++"
  "-DCMAKE_Fortran_COMPILER=gfortran"
  "-DTriBITS_TRACE_ADD_TEST=ON"
  )

SET(CTEST_TEST_TYPE Nightly)

#
# Run the CTest driver and submit to CDash
#

TRIBITS_PROJ_CTEST_DRIVER()
