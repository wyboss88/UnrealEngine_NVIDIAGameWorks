#
# Build ApexCommon
#

SET(GW_DEPS_ROOT $ENV{GW_DEPS_ROOT})
FIND_PACKAGE(PxShared REQUIRED)
FIND_PACKAGE(NvSimd REQUIRED)

SET(APEX_MODULE_DIR ${PROJECT_SOURCE_DIR}/../../../module)

SET(AM_SOURCE_DIR ${APEX_MODULE_DIR}/common)

SET(COMMON_SOURCE_DIR ${PROJECT_SOURCE_DIR}/../../../common)

# Use generator expressions to set config specific preprocessor definitions
SET(APEXCOMMON_COMPILE_DEFS

	# Common to all configurations
	${APEX_HTML5_COMPILE_DEFS};_LIB;;NX_USE_SDK_STATICLIBS;NX_FOUNDATION_STATICLIB;NV_PARAMETERIZED_HIDE_DESCRIPTIONS=1;ENABLE_TEST=0

	$<$<CONFIG:debug>:${APEX_HTML5_DEBUG_COMPILE_DEFS};>
	$<$<CONFIG:checked>:${APEX_HTML5_CHECKED_COMPILE_DEFS};>
	$<$<CONFIG:profile>:${APEX_HTML5_PROFILE_COMPILE_DEFS};>
	$<$<CONFIG:release>:${APEX_HTML5_RELEASE_COMPILE_DEFS};>
)

# include common ApexCommon.cmake
INCLUDE(../common/ApexCommon.cmake)
