#
# Copyright © 2017, Aryan Kedare @ xda-developers
#
# This is a build script for building Devil Kernel builds
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#!/bin/bash

clear

VAR=""
BUILD_DATE=$(date +"%Y%m%d")
IMAGE=$TREE/arch/arm64/boot/Image.gz-dtb

# shell script colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
nocol='\033[0m'         # Default

# fixed settings
export ARCH=arm64
export SUBARCH=arm64
export CONFIG_NO_ERROR_ON_MISMATCH=y
export CROSS_COMPILE=aarch64-linux-android-
JOBS=-j1

# change as per you want
export PATH=/builds/aryankedare/android_kernel_devil_lenovo_aio_row/aarch64-linux-android-6.0/bin:$PATH
export KBUILD_BUILD_USER="aryankedare"
export KBUILD_BUILD_HOST="devilsworkshop"
DEVICE="aio_row"
CONFIG="devil_defconfig"

#export CONFIG_DEBUG_SECTION_MISMATCH=y

# Function declaration
devil_compile() {
                echo "$red *******************************"
                echo "$green*    Compilation in Progress    *"
                echo "$blue *******************************$defcol"
                BUILD_BEGIN=$(date +"%s")
                make $CONFIG
                make $JOBS
                BUILD_TIME=$(date +"%H%M")
                if ![ -e "$IMAGE" ]; then
                echo "$red Error 404: Kernel not compiled."
                echo "Fix the compilation errors! $defcol"
                exit 1; fi;
                BUILD_END=$(date +"%s")
                DIFF=$(($BUILD_END - $BUILD_BEGIN))
                echo "$yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
                    }

# Script Menu

clear

echo -e "$Red                     ___                                      $nocol"                   
echo -e "$Red        _____       /\__\        ___                          $nocol"
echo -e "$Red       /::\  \     /:/ _/_      /\  \     ___                 $nocol"
echo -e "$Red      /:/\:\  \   /:/ /\__\     \:\  \   /\__\                $nocol"
echo -e "$Red     /:/  \:\__\ /:/ /:/ _/_     \:\  \ /:/__/   ___     ___  $nocol"
echo -e "$Red    /:/__/ \:|__/:/_/:/ /\__\___  \:\__/::\  \  /\  \   /\__\ $nocol"
echo -e "$Red    \:\  \ /:/  \:\/:/ /:/  /\  \ |:|  \/\:\  \_\:\  \ /:/  / $nocol"
echo -e "$Red     \:\  /:/  / \::/_/:/  /\:\  \|:|  |~~\:\/\__\:\  /:/  /  $nocol"
echo -e "$Red      \:\/:/  /   \:\/:/  /  \:\__|:|__|   \::/  /\:\/:/  /   $nocol"
echo -e "$Red       \::/  /     \::/  /    \::::/__/    /:/  /  \::/  /    $nocol"
echo -e "$Red        \/__/       \/__/      ~~~~        \/__/    \/__/     $nocol"

devil_compile