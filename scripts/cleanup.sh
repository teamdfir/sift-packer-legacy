#!/bin/bash -eux

# Remove VMWare Tools
rm -rf /home/sansforensics/linux.iso

# Remove Fonts that require License Agreement
apt-get remove -y ttf-mscorefonts-installer

# Make sure everything is up to date.
apt-get update

# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
