#include <opencv2/opencv.hpp>
#include "cuda_utils.h"

int main() {
    // Load the image
    cv::Mat image = cv::imread("data/img.png", cv::IMREAD_COLOR);
    if (image.empty()) {
        std::cerr << "Failed to load image." << std::endl;
        return -1;
    }

    // Convert image to grayscale using CUDA
    cv::Mat gray_image;
    cudaGrayscale(image, gray_image);

    // Display the images
    cv::imshow("Original Image", image);
    cv::imshow("Grayscale Image", gray_image);

    cv::waitKey(0);
    return 0;
}