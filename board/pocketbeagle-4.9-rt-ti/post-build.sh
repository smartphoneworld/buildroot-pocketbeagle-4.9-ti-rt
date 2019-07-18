#!/bin/sh
# post-image.sh for CircuitCo BeagleBone and TI am335x-evm
# 2014, Marcin Jabrzyk <marcin.jabrzyk@gmail.com>
# 2016, Lothar Felten <lothar.felten@gmail.com>

BOARD_DIR="$(dirname $0)"

# copy the uEnv.txt to the output/images directory
#cp board/pocketbeagle-4.9-rt-ti/uEnv.txt $BINARIES_DIR/uEnv.txt
if [ -e  $BINARIES_DIR/shared_area_landmark ]
then
	echo Image made before
else
	echo Patching "${TARGET_DIR}/etc/fstab"
	mkdir -p "${TARGET_DIR}/mnt/shared/mounted/"
	touch $BINARIES_DIR/shared_area_landmark
	echo "/dev/mmcblk0p3  /mnt/shared/mounted/    auto    rw      0       1">>"${TARGET_DIR}/etc/fstab"
fi
