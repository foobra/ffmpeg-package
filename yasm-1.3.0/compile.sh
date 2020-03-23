#!/bin/sh
if [ -f /etc/redhat-release ]; then
    ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && make -j8 && make install
fi

if [ -f /etc/lsb-release ]; then
    ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
    make -j8 && \
    make install
fi


