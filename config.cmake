option(SPARSE_BUILD_TOOLS "build tools" OFF)
option(SPARSE_BUILD_BENCHMARK "build benchmark" OFF)

# enable to use hip to accelerate on GPU/DCU side.
option(ARCH_HIP_ENABLE_FLAG "Enable HIP" OFF)
# enable to use OpenMP to accelerate on GPU/DCU side.
option(SPARSE_OMP_ENABLED_FLAG "Enable OpenMP" OFF)


# threads number in a wavefront (which is usually 64 for AMD GPU and 32 for NVIDIA GPU)
set(ARCH_HIP_WAVEFRONT_SIZE "64" CACHE STRING "threads number in a wavefront")

if (ARCH_HIP_ENABLE_FLAG)
    set(SPARSE_LIB_NAME sp-het-hip)
    set(SPARSE_KERNEL_LIB_NAME sp-kernels)
    # add linked libs
    set(ACC_LIBS ${ACC_LIBS} ${SPARSE_KERNEL_LIB_NAME})
else ()
    set(SPARSE_LIB_NAME sp-host)
endif ()
