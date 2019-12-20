#!/bin/bash
# Get the source ;
source scripts/getKernelSourcesNoGUI.sh
# We use QT 5 for the configuration GUI
apt-get install qt5-default -y
# cd /usr/src/kernel/kernel-4.4
cd /usr/src/$KERNEL_FOLDER
make xconfig

