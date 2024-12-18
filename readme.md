# CUDA OpenCV C++ Project

This project demonstrates how to combine CUDA and OpenCV to create a simple image processing application. It includes examples of:
- Using OpenCV for image loading, manipulation, and display.
- Leveraging CUDA for high-performance parallel processing on images.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

1. **CUDA Toolkit**: Version 10.1 or higher.
2. **OpenCV**: Version 4.x or higher.
3. **CMake**: For building the project.
4. **A C++ Compiler**: Supporting C++11 or later (e.g., GCC, MSVC, or Clang).

## Project Structure

```
cuda_opencv_cpp-project/
├── CMakeLists.txt        # Build configuration
├── src/
│   ├── main.cpp          # Main application logic
│   ├── cuda_utils.cu     # CUDA kernel and utility functions
│   ├── cuda_utils.h      # Header for CUDA utilities
├── data/
│   └── img.png        # Example input image
└── README.md             # Project documentation
```

## Features

- Load an image using OpenCV.
- Process the image with a CUDA kernel to apply effects (e.g., grayscale conversion).
- Display the original and processed images using OpenCV.

## Getting Started

### Clone the Repository
```bash
git clone https://github.com/<your-username>/cuda_opencv_cpp-project.git
cd cuda_opencv_cpp-project
```

### Build the Project

1. Create a build directory and navigate into it:
   ```bash
   mkdir build && cd build
   ```

2. Run CMake to generate build files:
   ```bash
   cmake ..
   ```

3. Build the project:
   ```bash
   make
   ```

### Run the Application

Execute the compiled binary:
```bash
./cuda_opencv_app
```

### Expected Output

The application will:
1. Load `sample.jpg` from the `data/` folder.
2. Apply a CUDA-based image processing algorithm (e.g., grayscale conversion).
3. Display the original and processed images in separate windows.

