#!/bin/bash

source poky/oe-init-build-env rpi-build

cat <<EOF >>conf/local.conf

MACHINE="raspberrypi3-64"
ENABLE_UART = "1"

CORE_IMAGE_EXTRA_INSTALL += "openssh"
IMAGE_INSTALL_append = "lava-dispatcher"
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

#
#
#
BBLAYERS =+ " \
  /home/lollivier/lavamini/meta-virtualization \
  "


#
# This needs to be VCSed
#
BBLAYERS =+ " \
  /home/lollivier/lavamini/meta-lava/meta-lava-dispatcher \
  "
EOF
