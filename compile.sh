#!/bin/sh

cd nasm-2.14.02
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
cd yasm-1.3.0
if [ -f /etc/redhat-release ]; then
    ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && make -j8 && make install
fi

if [ -f /etc/lsb-release ]; then
    ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
    make -j8 && \
    make install
fi
cd -

cd x264
if [ -f /etc/redhat-release ]; then
    PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static --enable-pic && make -j `nproc` && make install
fi

if [ -f /etc/lsb-release ]; then
    PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static --enable-pic && \
    PATH="$HOME/bin:$PATH" make -j `nproc` && \
    make install
fi
cd -
cd ffmpeg-4.2.2

if [ ! -d /usr/local/cuda-10.2/ ]; then
  EXTRA_CFLAGS="-I${HOME}/ffmpeg_build/include\ -I/usr/local/cuda-10.2/include"
  EXTRA_LDFLAGS="-L$HOME/ffmpeg_build/lib\ -L/usr/local/cuda-10.2/lib64"
  EXTRA_NVIDIA_ENABLE="--enable-cuda --enable-cuvid --enable-nvenc --enable-lipnpp"
else
  EXTRA_CFLAGS="-I$HOME/ffmpeg_build/include"
  EXTRA_LDFLAGS="-L$HOME/ffmpeg_build/lib"
  EXTRA_NVIDIA_ENABLE=""
fi

if [ -f /etc/redhat-release ]; then
  PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="${EXTRA_CFLAGS}" \
  --extra-ldflags="${EXTRA_LDFLAGS}" \
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
  ${EXTRA_NVIDIA_ENABLE} \
 &&  PATH="$HOME/bin:$PATH" && make -j `nproc` && make install

fi

if [ -f /etc/lsb-release ]; then
  PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="${EXTRA_CFLAGS}" \
  --extra-ldflags="${EXTRA_LDFLAGS}" \
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
  ${EXTRA_NVIDIA_ENABLE} \
 &&  PATH="$HOME/bin:$PATH" && make -j `nproc` && make install
fi

cd -
