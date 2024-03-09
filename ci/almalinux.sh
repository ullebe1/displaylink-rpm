#!/bin/bash

set -e

## Workaround AlmaLinux 8 GPG key issue
## https://almalinux.org/blog/2023-12-20-almalinux-8-key-update/
rpm --import https://repo.almalinux.org/almalinux/RPM-GPG-KEY-AlmaLinux

dnf install -y gcc gcc-c++ glibc-devel.x86_64 glibc-devel.i686 libdrm-devel rpm-build make wget dnf-utils git 'dnf-command(builddep)' --enablerepo=extras

dnf builddep -y ./displaylink.spec

chown `id -u`:`id -g` -R .

make $SPECIFICTARGET
