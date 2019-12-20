#!/bin/bash

source scripts/jetson_variables.sh

#Print Jetson version
echo " - $JETSON_DESCRIPTION"
# Print Jetpack and kernel
echo "   * Jetpack $JETSON_JETPACK [L4T $JETSON_L4T]"
# Print CUDA GPU architecture
echo "   * CUDA GPU architecture $JETSON_CUDA_ARCH_BIN"

# Libraries
echo " - Libraries:"
#Print Cuda version
echo "   * CUDA $JETSON_CUDA"
# Print cuDNN version
echo "   * cuDNN $JETSON_CUDNN"
# Print OpenCV version
echo "   * OpenCV $JETSON_OPENCV"

exit 0


