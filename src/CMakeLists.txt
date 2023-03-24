include(configure.cmake)

set(HEADER_FILES
        api/spmv.h
        api/csr_desc.hpp
        )

set(SOURCE_FILES
        api/spmv.cc
        )

# set binary path and lib storage path for compiling process.
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

add_library(${SPARSE_LIB_NAME} STATIC ${SOURCE_FILES} ${HEADER_FILES})
target_include_directories(
        ${SPARSE_LIB_NAME}
        PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}$<SEMICOLON>${PROJECT_BINARY_DIR}/generated>
        $<INSTALL_INTERFACE:include>
    )


##########################
##### install files
##########################
# install bin and libs
install(TARGETS ${SPARSE_LIB_NAME}
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        )

# install header.
install(DIRECTORY "./"
        DESTINATION "include"
        FILES_MATCHING
        PATTERN "*.h"
        PATTERN "*.hpp"
        PATTERN "*.inl"
        )
