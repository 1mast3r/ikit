# iKit documentation

iKit is a program designed to manage iOS devices on the Linux operating system. It provides an alternative to iTunes for Linux users, allowing you to perform various operations on your iOS devices, such as file management, backup, restore, install and uninstall applications, and data synchronization.

## Installation

1. Check for installed dependencies:
   - libimobiledevice
   - idevicerestore
   - ideviceinstaller.
   - And dependencies on them.

   If some of the dependencies are missing, install them using the package manager of your Linux distribution.

2. Download the latest version of iKit from the official repository or developer's website.

3. Unzip the downloaded archive.

4. Navigate to the directory with the unzipped files.

5. Enter the command: bash install.sh
   The command will install iKit.

6. Then iKit will launch and you choose what you want to do.
7. when you're done with the program you can always run it by going to the iKit directory and typing the command bash ikit.sh


## Usage

iKit provides a command line kit for controlling iOS devices. Here are some basic commands you can use:

Backup Data - Create backups in .tar format and restore from it
Restore iOS - Restore iPhone with .ipsw firmware
Install Apps - Install apps for iOS in .ipa format
Data Control - manage contacts and notes
Get Information - get information about your device
Settings Manager - manage iPhone settings
Share Files - Synchronize iPhone with your computer and transfer files between them

These are examples of commands available in iKit.
## Notes

- Before using iKit, make sure that your iOS device is connected to your computer and is properly recognized by Linux.

- Some operations may require administrator rights.
