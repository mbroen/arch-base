#!/bin/bash

set -e

pacman-key --init && pacman-key --populate archlinux

pacman -Sy sed --noconfirm --needed
sed -i '\~\[options\]~a # Do not extract the following folders from any packages being installed\n'\
'NoExtract   = usr/share/locale* !usr/share/locale/en* !usr/share/locale/locale.alias\n'\
'NoExtract   = usr/share/doc*\n'\
'NoExtract   = usr/share/man*\n'\
'NoExtract   = usr/share/gtk-doc*\n' \
/etc/pacman.conf

pacman -Syu --noconfirm

pacman -S grep --noconfirm --needed

pacman -S $(pacman -Sgq base | \
grep -v filesystem | \
grep -v cryptsetup | \
grep -v device-mapper | \
grep -v dhcpcd | \
grep -v iproute2 | \
grep -v jfsutils | \
grep -v libsystemd | \
grep -v linux | \
grep -v lvm2 | \
grep -v man-db | \
grep -v man-pages | \
grep -v mdadm | \
grep -v nano | \
grep -v netctl | \
grep -v pciutils | \
grep -v pcmciautils | \
grep -v reiserfsprogs | \
grep -v s-nail | \
grep -v systemd | \
grep -v systemd-sysvcompat | \
grep -v usbutils | \
grep -v xfsprogs) \
 --noconfirm --needed

pacman -S git awk sed supervisor vi openssl moreutils sudo binutils --noconfirm --needed

su aur <<EOF
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git yay
cd yay
makepkg -si --noconfirm
EOF
