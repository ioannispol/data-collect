# GCC support can be specified at major, minor, or micro version
# (e.g. 8, 8.2 or 8.2.0).
# See https://hub.docker.com/r/library/gcc/ for all supported GCC
# tags from Docker Hub.
# See https://docs.docker.com/samples/library/gcc/ for more on how to use this image
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install -y \
    build-essential \
    cmake \
    git \
    libboost-all-dev \
    libeigen3-dev \
    libgmp-dev \
    libmpfr-dev \
    libmpc-dev \
    libssl-dev \
    libtool \
    libz-dev \
    pkg-config \
    python3 \
    python3-pip \
    wget \
    zlib1g-dev

RUN echo "=================== Install OpenCV ==================="
COPY ~/.sripts/opencv_install.sh ~/opencv_install.sh
RUN cd ~ && chmod +x opencv_install.sh && ./opencv_install.sh

RUN echo "=================== Install librealsense ==================="
COPY ~/.sripts/librealsense_install.sh ~/librealsense_install.sh
RUN cd ~ && chmod +x librealsense_install.sh && ./librealsense_install.sh

RUN echo "=================== Data Collection ==================="

RUN git clone https://github.com/ioannispol/data-collect.git

RUN echo "=================== Data Collection repo Downloaded ==================="
RUN cd data-collect
WORKDIR "/data-collect/"
     
# These commands copy your files into the specified directory in the image
# and set that as the working location
# COPY . /usr/src/myapp
# WORKDIR /usr/src/myapp

# # This command compiles your app using GCC, adjust for your source code
# RUN g++ -o myapp main.cpp

# # This command runs your application, comment out this line to compile only
# CMD ["./myapp"]

# LABEL Name=datacollect Version=0.0.1
