# This is an auto generated Dockerfile for ros:perception
# generated from docker_images/create_ros_image.Dockerfile.em
FROM ubuntu:20.04

# Use bash instead of sh
SHELL ["/bin/bash", "-c"]

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Update package list and install necessary packages
RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the timezone to avoid prompts
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata



# install ros packages
RUN apt-get update \
    && apt-get upgrade \
    && sh -c 'echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros-latest.list' \
    && apt install -y curl \
    && apt-get install -y gnupg \
    && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - \
    && apt update \
    && apt install -y ros-noetic-desktop-full \
    && source /opt/ros/noetic/setup.bash \
    && echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc \
    && apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential \
    && apt install -y python3-rosdep \
    && rosdep init \
    && rosdep update


# installing dependencies Embree
RUN apt-get update \
    && apt-get -y install libassimp-dev libglfw3 libglfw3-dev\
    && apt install -y git \
    && cd /root/ \
    && git clone https://github.com/embree/embree.git \
    && mkdir embree/build \
    && cd embree/build \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make -j`nproc` \
    && make install

# rmagine
RUN cd /root/ \
    && git clone https://github.com/uos/rmagine.git \
    && cd rmagine \
    && git checkout -b v2.2.5 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make -j12 \
    && make install \
    && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib \
    && rmagine_benchmark_cpu ../dat/sphere.ply 

# lvr2
RUN cd /root/ \
    && apt-get install -y build-essential \
    cmake cmake-curses-gui libflann-dev \
    libgsl-dev libeigen3-dev libopenmpi-dev \
    openmpi-bin opencl-c-headers ocl-icd-opencl-dev \
    libvtk7-dev libvtk7-qt-dev libboost-all-dev \
    freeglut3-dev libhdf5-dev qtbase5-dev \
    qt5-default libqt5opengl5-dev liblz4-dev \
    libopencv-dev libyaml-cpp-dev \
    && git clone https://github.com/uos/lvr2.git \
    && cd lvr2 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make -j12 \
    && export CMAKE_PREFIX_PATH=/root/lvr2/build:$CMAKE_PREFIX_PATH

# lz4
RUN cd /root/ \
    && git clone -b v1.10.0 --single-branch https://github.com/lz4/lz4.git \
    && cd lz4 \
    && make \
    && make install

# some extra dependencies
RUN apt install -y opencl-clhpp-headers \
    && apt install -y ocl-icd-opencl-dev \
    && apt-get install -y ros-noetic-lvr2 \
    && apt-get install -y opencl-headers \
    && apt-get install ros-noetic-imu-tools

