#!/bin/sh

cd nasm-2.14.02 && sh compile.sh && cd ..
cd yasm-1.3.0 && sh compile.sh && cd ..
cd x264 && sh compile.sh && cd ..
cd ffmpeg-4.2.2 && sh compile.sh && cd ..
