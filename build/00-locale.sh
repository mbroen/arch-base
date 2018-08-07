#!/bin/bash

set -e

echo en_GB.UTF-8 UTF-8 > /etc/locale.gen
locale-gen
echo LANG="en_GB.UTF-8" > /etc/locale.conf
