#!/bin/bash

source poky/oe-init-build-env rpi-build

cat <<EOF >>conf/local.conf

MACHINE="raspberrypi3-64"
ENABLE_UART = "1"
EOF

cat <<EOF >>conf/bblayers.conf

#
# meta-openembedded dependencies for meta-raspberrypi
#
BBLAYERS =+ " \\
  /home/lollivier/yocto/poky/meta-openembedded/meta-oe \\
  /home/lollivier/yocto/poky/meta-openembedded/meta-multimedia \\
  /home/lollivier/yocto/poky/meta-openembedded/meta-networking \\
  /home/lollivier/yocto/poky/meta-openembedded/meta-python \\
  "

#
# meta-raspberrypi
#
BBLAYERS =+ " \\
  /home/lollivier/yocto/poky/meta-raspberrypi \\
  "
EOF