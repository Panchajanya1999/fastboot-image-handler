# Flashable Image and Flashing Script

This set of scripts allows you to create a fastboot flashable image that contains the kernel files for your device, as well as flash that image to your device via fastboot. The scripts are named `handler.sh` and `flash.sh`, respectively.

## Requirements

-   A Unix-like operating system (e.g. Linux or macOS)
-   A device that supports fastboot mode
-   The fastboot tool installed on your computer
-   The `handler.sh` and `flash.sh` scripts in a directory of your choosing
## Usage

### Creating a Fastboot Flashable Image

To create a fastboot flashable image with the kernel files for your device, run the `handler.sh` script with the following syntax:

> bash
> 
> `./handler.sh [DEVICE_NAME]`

Replace `[DEVICE_NAME]` with the name of your device. Currently, `bluejay` and `raviole` are supported device names.

The `handler.sh` script will create a flashable image that contains the following kernel files:

-   `boot.img`
-   `dtbo.img`
-   `vendor_boot.img`
-   `vendor_dlkm.img`

The script should be put inside the root directory of the kernel build environment. This directory is the same directory from where we run  `./build/build.sh`. From this directory the script will automatically find the kernel files and create the flashable image.

The resulting image will be saved in the `build_out` folder, with a file name of the form `image-[KERNEL_NAME]-[DEVICE_NAME]-[VERSION]-[DATE].zip`.

### Flashing the Fastboot Flashable Image

To flash the fastboot flashable image to your device, run the `flash.sh` script with the following syntax:

bashCopy code

`./flash.sh [DEVICE_NAME]` 

Replace `[DEVICE_NAME]` with the name of your device. Currently, `bluejay` and `raviole` are supported device names.

The `flash.sh` script will flash the fastboot flashable image to your device via fastboot. Make sure your device is in fastboot mode and connected to your computer before running the script.

## Troubleshooting

If you encounter any issues while using these scripts, please consult the `handler.sh` and `flash.sh` scripts for comments and documentation, or contact the author for support.

## License

This set of scripts is licensed under the GNU General Public License. See the `LICENSE` file for details.
