VAR=""
BUILD_DATE=$(date +"%Y%m%d")
TREE=$PWD
AK="$TREE/AnyKernel2"
IMAGE=$TREE/arch/arm64/boot/Image.gz-dtb
OUTPUTDIR=$TREE/output

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
JOBS=-j$(nproc)

# change as per you want
export PATH=/home/aryan/aarch64-linux-android-6.0/bin:$PATH
export KBUILD_BUILD_USER="aryankedare"
export KBUILD_BUILD_HOST="devilsworkshop"
DEVICE="aio_row"
CONFIG="devil_defconfig"

#export CONFIG_DEBUG_SECTION_MISMATCH=y

devil_clean() {
                cd $AK
                rm -rf Image.gz-dtb
                cd ..
                make clean && make mrproper
                rm -rf $OUTPUTDIR/*
                   }

devil_clean
