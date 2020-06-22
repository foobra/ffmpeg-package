#!/bin/sh
cd packages/id3lib-3.8.3
if [ -f /etc/redhat-release ]; then
    ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && make -j8 && make install
fi

if [ -f /etc/lsb-release ]; then
	PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
PATH="$HOME/bin:$PATH" make -j `nproc` && make install
fi
cd -

