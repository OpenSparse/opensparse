# configure a header file to pass some of the CMake settings to the source code
if (ARCH_HIP_ENABLE_FLAG)
    set(ARCH_NAME hip)
    set(ACCELERATE_ENABLED ON)
    set(ARCH_HIP ON)
    MESSAGE(STATUS "HIP acceleration is enabled")
else ()

endif ()

set(__WF_SIZE__ ${ARCH_HIP_WAVEFRONT_SIZE})

configure_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/sparse_building_config.h.in"
        "${PROJECT_BINARY_DIR}/generated/sparse_building_config.h"
)

# install the generated file
install(FILES "${PROJECT_BINARY_DIR}/generated/building_config.h"
        DESTINATION "include"
        )
