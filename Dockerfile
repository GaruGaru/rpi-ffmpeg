FROM resin/rpi-raspbian

RUN apt-get update && apt-get install libomxil-bellagio-dev git -y
RUN git clone https://github.com/FFmpeg/FFmpeg.git
WORKDIR FFmpeg
RUN apt-get install gcc cmake build-essential
RUN ./configure --arch=armel --target-os=linux --enable-gpl --enable-omx --enable-omx-rpi --enable-nonfree
RUN make -j4
RUN make install

CMD ffmpeg
