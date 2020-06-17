#!/bin/sh
cd packages/lame-3.100
if [ -f /etc/redhat-release ]; then
    ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm --with-pic && make -j8 && make install
fi

if [ -f /etc/lsb-release ]; then
	PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm --with-pic && \
PATH="$HOME/bin:$PATH" make -j `nproc` && make install
fi
cd -
