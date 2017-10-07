# AnyKernel 2.0 Ramdisk Mod Script 
# osm0sis @ xda-developers

## AnyKernel setup
# EDIFY properties
kernel.string=Devil Kernel by Aryan Kedare @ xda-developers
do.devicecheck=1
do.system=0
do.initd=0
do.modules=1
do.cleanup=1
device.name1=aio_row
device.name2=A7000

# shell variables
block=/dev/block/platform/mtk-msdc.0/by-name/boot;

## end setup

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk

## AnyKernel install
dump_boot;

# init.d patch
append_file init.rc "init.d support" init_patch;
append_file default.prop "sys.init.d.loop=on" init_prop_patch;
mkdir /system/etc/init.d
chmod -R 755 /system/etc/init.d
cp /tmp/anykernel/tools/busybox /system/xbin
chmod 755 /system/xbin/busybox

# adb secure
replace_string default.prop "ro.adb.secure=0" "ro.adb.secure=1" "ro.adb.secure=0";
replace_string default.prop "ro.secure=0" "ro.secure=1" "ro.secure=0";
# add spectrum support
insert_line init.mt6752.rc "import /init.spectrum.rc" after "import init.project.rc" "import /init.spectrum.rc\n";

# end ramdisk changes

write_boot;

## end install

