cmake_minimum_required(VERSION 3.18) # use CUDA lang

project(open-sparse)

set(CMAKE_CXX_STANDARD 14)

include(config.cmake)

add_subdirectory(src)

if(SPARSE_BUILD_BENCHMARK)
    add_subdirectory(benchmark)
endif()

if(SPARSE_BUILD_TOOLS)
    add_subdirectory(tools)
endif()
