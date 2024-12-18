cmake_minimum_required(VERSION 2.8)
project(testOpencv)

find_package(OpenCV REQUIRED)

set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -O3")
find_package(CUDA REQUIRED)

include_directories(${OpenCV_INCLUDE_DIRS})
include_directories(${CUDA_INCLUDE_DIRS})

set(SRC_FILES src/main.cpp src/cuda_utils.cu)

cuda_add_executable(testOpencv ${SRC_FILES})

target_link_libraries(testOpencv ${OpenCV_LIBS})