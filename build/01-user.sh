#!/bin/bash

set -e

usermod -g users nobody
usermod -a -G nobody nobody

mkdir -p /home/nobody
chown -R nobody:users /home/nobody
chmod -R 775 /home/nobody

usermod -d /home/nobody nobody
chsh -s /bin/bash nobody

# Add AUR user
AUR_USER=aur
useradd -m $AUR_USER
# Set user password to blank
echo "${AUR_USER}:" | chpasswd -e

mkdir -p /etc/sudoers.d/
echo "$AUR_USER      ALL = NOPASSWD: ALL" >> /etc/sudoers.d/aur
