FROM ros:foxy

ENV DEBIAN_FRONTEND=noninteractive

# Builder dependencies installation
RUN apt-get update \
    && apt-get install -qq -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    libssl-dev \
    libusb-1.0-0-dev \
    pkg-config \
    libgtk-3-dev \
    libglfw3-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \    
    curl \	
    libusb-1.0-0 \
    udev \
    apt-transport-https \
    ca-certificates \
    curl \
    swig \
    software-properties-common \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/YDLIDAR/YDLidar-SDK.git &&\
    mkdir -p YDLidar-SDK/build && \
    cd YDLidar-SDK/build &&\
    cmake ..&&\
    make &&\
    make install &&\
    cd .. &&\
    pip install . &&\
    cd .. && rm -r YDLidar-SDK 

RUN echo "source /opt/ros/foxy/setup.bash" >> /etc/bash.bashrc

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
   && apt-get -y install --no-install-recommends  ros-foxy-xacro ros-foxy-gazebo* ros-foxy-rviz2* ros-foxy-joint-state-publisher-gui ros-foxy-teleop-twist-keyboard\
   #
   # Clean up
   && apt-get autoremove -y \
   && apt-get clean -y \
   && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog  