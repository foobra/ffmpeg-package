#!/bin/sh

if [ -f /etc/redhat-release ]; then
  PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --disable-debug \
  --extra-libs=-lpthread \
  --extra-libs=-lm \
  --extra-libs=-lz \
  --extra-libs=-ldl \
  --bindir="$HOME/bin" \
  --disable-postproc \
  --enable-x86asm \
  --enable-gpl \
  --enable-pic \
  --enable-libx264 \
  --enable-nonfree \
  --enable-static \
  --disable-shared \
 &&  PATH="$HOME/bin:$PATH" && make -j `nproc` && make install

fi

if [ -f /etc/lsb-release ]; then
  PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --disable-debug \
  --extra-libs=-lpthread \
  --extra-libs=-lm \
  --extra-libs=-lz \
  --extra-libs=-ldl \
  --bindir="$HOME/bin" \
  --disable-postproc \
  --enable-x86asm \
  --enable-gpl \
  --enable-pic \
  --enable-libx264 \
  --enable-nonfree \
  --enable-static \
  --disable-shared \
 &&  PATH="$HOME/bin:$PATH" && make -j `nproc` && make install
fi



