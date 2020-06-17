#!/bin/sh

cd packages/nasm-2.14.02
if [ -f /etc/redhat-release ]; then
    ./autogen.sh && PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && make -j8 && make install
fi

if [ -f /etc/lsb-release ]; then
    ./autogen.sh && \
    PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
    make -j8 && \
    make install
fi
cd -
