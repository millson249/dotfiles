#!/bin/sh
#
# yay installation script
#

if [ -d /tmp/yay-source ]; then
    echo "Removing /tmp/yay-source..."
    rm -rf /tmp/yay-source
fi
echo "Creating /tmp/yay-source..."
mkdir /tmp/yay-source
cd /tmp/yay-source
echo "Grabbing package-query and yay packages from AUR..."
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
echo "Unpacking..."
tar zxvf yay.tar.gz
echo "Installing yay..."
cd yay
makepkg -is
