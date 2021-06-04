#!/bin/sh
#
# paru-bin installation script
#

if [ -d /tmp/paru-bin-source ]; then
    echo "Removing /tmp/paru-bin-source..."
    rm -rf /tmp/paru-bin-source
fi
echo "Creating /tmp/paru-bin-source..."
mkdir /tmp/paru-bin-source
cd /tmp/paru-bin-source
echo "paru-bin package from AUR..."
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/paru-bin.tar.gz
echo "Unpacking..."
tar zxvf paru-bin.tar.gz
echo "Installing paru-bin..."
cd paru-bin
makepkg -is
