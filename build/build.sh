#!/bin/bash

set -e

for script in `ls | egrep '[0-9]{2}.*\.sh'`; do
  /bin/bash `readlink -f ${script}`
done
