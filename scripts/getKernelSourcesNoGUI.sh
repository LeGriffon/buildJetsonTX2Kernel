#!/bin/bash

source scripts/jetson_variables.sh

# apt-add-repository universe
# apt-get update
# apt-get install pkg-config -y
cd /usr/src

# List of kernel link
KERNEL_LINK=""
KERNEL_INTERNAL_FOLDER=""
KERNEL_FOLDER=""

# Download kernel
case $JETSON_L4T in
    "31.1.0")
            KERNEL_LINK="https://developer.download.nvidia.com/embedded/L4T/r31_Release_v1.0/BSP/public_sources.tbz2"
            KERNEL_INTERNAL_FOLDER="public_release/kernel_src.tbz2"
            KERNEL_FOLDER="kernel/kernel-4.9" 
            ;;
    "28.3.2")
            KERNEL_LINK="https://developer.nvidia.com/embedded/dlc/r28_Release_v3.1/sources/T186/public_sources.tbz2"
            KERNEL_INTERNAL_FOLDER="public_sources/kernel_src.tbz2"
            KERNEL_FOLDER="kernel/kernel-4.4" 
            ;;
    "28.3.1")
            KERNEL_LINK="https://developer.nvidia.com/embedded/dlc/r28_Release_v3.1/sources/T186/public_sources.tbz2"
            KERNEL_INTERNAL_FOLDER="public_sources/kernel_src.tbz2"
            KERNEL_FOLDER="kernel/kernel-4.4" 
            ;;
    "28.2.1")
            KERNEL_LINK="https://developer.download.nvidia.com/embedded/L4T/r28_Release_v2.1/public_sources.tbz2"
            KERNEL_INTERNAL_FOLDER="public_release/kernel_src.tbz2"
            KERNEL_FOLDER="kernel/kernel-4.4" 
            ;;
    "28.2.0")
            KERNEL_LINK="http://developer.download.nvidia.com/embedded/L4T/r28_Release_v2.0/GA/BSP/$(echo "${JETSON_BOARD,,}")_sources.tbz2"
            KERNEL_INTERNAL_FOLDER="public_release/kernel_src.tbz2"
            KERNEL_FOLDER="kernel/kernel-4.4" 
            ;;
    "28.1") 
            KERNEL_LINK="http://developer.download.nvidia.com/embedded/L4T/r28_Release_v1.0/BSP/source_release.tbz2"
            KERNEL_INTERNAL_FOLDER="sources/kernel_src-$(echo "${JETSON_BOARD,,}").tbz2"
            KERNEL_FOLDER="kernel/kernel-4.4"
            ;;
    "27.1") 
            KERNEL_LINK="http://developer.download.nvidia.com/embedded/L4T/r27_Release_v1.0/BSP/r27.1.0_sources.tbz2"
            KERNEL_INTERNAL_FOLDER="kernel_src.tbz2"
            KERNEL_FOLDER="kernel/kernel-4.4"
            ;;
    * )     ;;
esac

#Print Jetpack Kernel Link
echo "Jetpack Kernel Link $KERNEL_LINK"

wget -N $KERNEL_LINK
sudo tar -xvf public_sources.tbz2 $KERNEL_INTERNAL_FOLDER
tar -xvf $KERNEL_INTERNAL_FOLDER
# Space is tight; get rid of the compressed kernel source
# rm -r public_sources

cd $KERNEL_FOLDER

# Go get the default config file; this becomes the new system configuration
zcat /proc/config.gz > .config