#!/bin/bash

set -e

usermod -g users nobody
usermod -a -G nobody nobody

mkdir -p /home/nobody
chown -R nobody:users /home/nobody
chmod -R 775 /home/nobody

usermod -d /home/nobody nobody
chsh -s /bin/bash nobody
