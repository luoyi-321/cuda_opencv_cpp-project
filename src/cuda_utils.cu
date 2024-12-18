#include <opencv2/opencv.hpp>
#include "cuda_utils.h"

__global__ void grayscaleKernel(unsigned char* d_input, unsigned char* d_output, int width, int height, int channels) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        int idx = (y * width + x) * channels;
        unsigned char r = d_input[idx];
        unsigned char g = d_input[idx + 1];
        unsigned char b = d_input[idx + 2];
        d_output[y * width + x] = 0.299f * r + 0.587f * g + 0.114f * b;
    }
}

void cudaGrayscale(const cv::Mat& input, cv::Mat& output) {
    int width = input.cols;
    int height = input.rows;
    int channels = input.channels();

    output.create(height, width, CV_8UC1);

    size_t inputSize = width * height * channels;
    size_t outputSize = width * height;

    unsigned char *d_input, *d_output;
    cudaMalloc(&d_input, inputSize);
    cudaMalloc(&d_output, outputSize);

    cudaMemcpy(d_input, input.data, inputSize, cudaMemcpyHostToDevice);

    dim3 blockSize(16, 16);
    dim3 gridSize((width + blockSize.x - 1) / blockSize.x, (height + blockSize.y - 1) / blockSize.y);

    grayscaleKernel<<<gridSize, blockSize>>>(d_input, d_output, width, height, channels);

    cudaMemcpy(output.data, d_output, outputSize, cudaMemcpyDeviceToHost);

    cudaFree(d_input);
    cudaFree(d_output);
}