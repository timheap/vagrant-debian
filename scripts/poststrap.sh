#!/bin/bash

dd if=/dev/zero of=/swapfile1 bs=1024 count=1024000
mkswap /swapfile1
swapon /swapfile1
echo "/swapfile1  none  swap  sw  0  0" >> /etc/fstab

# One of these brings in the x11 utils as a recommends, which is really not needed
apt-get install --no-install-recommends virtualbox-guest-dkms virtualbox-guest-utils

mv /etc/rc.local.bak /etc/rc.local
shutdown -h now
