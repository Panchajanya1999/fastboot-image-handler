# handler - a script to handle the creation of fastboot flashable image files
#
# Copyright (c) 2023, Panchajanya1999 <kernel@panchajanya.dev>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#

NAME="azure"
VERSION="YGL"
DATE=$(date +%Y%m%d)

# image name
DEVICE_NAME=$1
IMG_NAME="image-$NAME-$DEVICE_NAME-$VERSION-$DATE"
BRANCH=android13-gs-pixel-5.10

# set the build artifacts
BOOT=out/$BRANCH/dist/boot.img
DTBO=out/$BRANCH/dist/dtbo.img
VENDOR_BOOT=out/$BRANCH/dist/vendor_boot.img
VENDOR_DLKM=out/$BRANCH/dist/vendor_dlkm.img

# Considering the fact that we are the build root directory
# create a folder named "build_out" and place the image there
OUT_DIR="$PWD/build_out"
mkdir -p "$OUT_DIR"

# create a folder inside the build_out folder and name it whatever  IMG_NAME

# copy the build artifacts to the image folder
cp "$BOOT" "$OUT_DIR"
cp "$DTBO" "$OUT_DIR"
cp "$VENDOR_BOOT" "$OUT_DIR"
cp "$VENDOR_DLKM" "$OUT_DIR"

# create a zip file of the image folder
cd "$OUT_DIR" || exit
zip -r "$IMG_NAME".zip .

# remove the images
rm -rf boot.img dtbo.img vendor_boot.img vendor_dlkm.img 