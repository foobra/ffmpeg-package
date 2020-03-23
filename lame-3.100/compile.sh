#!/bin/sh
source ~/.bashrc
source /opt/rh/devtoolset-9/enable
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --with-pic --disable-shared --enable-nasm  && make -j8 && make install
