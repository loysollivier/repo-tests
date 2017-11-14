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
BBLAYERS =+ " \
  /home/lollivier/lavamini/meta-openembedded/meta-oe \
  /home/lollivier/lavamini/meta-openembedded/meta-multimedia \
  /home/lollivier/lavamini/meta-openembedded/meta-networking \
  /home/lollivier/lavamini/meta-openembedded/meta-python \
  "

#
# meta-raspberrypi
#
BBLAYERS =+ " \
  /home/lollivier/lavamini/meta-raspberrypi \
  "

#
# meta-lava-dispatcher
#
BBLAYERS =+ " \
  /home/lollivier/lavamini/meta-lava/meta-lava-dispatcher \
  "
#
# python-backports-lzma for lava-dispatcher
#
BBLAYERS =+ " \
  /home/lollivier/lavamini/meta-openembedded/meta-filesystems \
  /home/lollivier/lavamini/meta-virtualization \
  "

#
# python-nose for lava-dispatcher
#
BBLAYERS =+ " \
  /home/lollivier/lavamini/poky/meta \
  "

EOF
