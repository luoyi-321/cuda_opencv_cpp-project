#ifndef CUDA_UTILS_H
#define CUDA_UTILS_H

#include <opencv2/opencv.hpp>

// Function to convert an image to grayscale using CUDA
void cudaGrayscale(const cv::Mat& input, cv::Mat& output);

#endif // CUDA_UTILS_H