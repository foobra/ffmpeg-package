#!/bin/sh

rm -rf packages || true
mkdir packages  || true

tar -xvf ffmpeg-4.2.2.tar.gz -C packages
tar -xvf yasm-1.3.0.tar.gz -C packages
tar -xvf nasm-2.14.02.tar.bz2 -C packages
tar -xvf x264.tar -C packages
tar -xvf lame-3.100.tar.gz -C packages
tar -xvf id3lib-3.8.3.tar.gz -C packages