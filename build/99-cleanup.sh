#!/bin/bash

set -e

yes|pacman -Scc
rm -rf /usr/share/locale/*
rm -rf /usr/share/man/*
rm -rf /usr/share/gtk-doc/*
rm -rf /root/*
rm -rf /tmp/*
