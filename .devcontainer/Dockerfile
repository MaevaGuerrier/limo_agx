FROM osrf/ros:noetic-desktop-focal

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
    wget \
    software-properties-common \
    python3-pip
 

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-desktop-full=1.5.0-1* \
    ros-noetic-gazebo* ros-noetic-rviz \
    tmux ros-noetic-teleop-twist-keyboard \
    && rm -rf /var/lib/apt/lists/*

# From requirement file of originial repo
# RUN pip install torch torchvision numpy matplotlib pyyaml


# RUN git clone https://github.com/real-stanford/diffusion_policy.git &&\
#     pip install -e diffusion_policy/


# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda 
ENV PATH=$CONDA_DIR/bin:$PATH

COPY ./deployment_environment.yaml /tmp/deployment_environment.yaml  
# RUN wget https://github.com/MaevaGuerrier/visualnav-transformer/blob/main/deployment/deployment_environment.yaml && \
RUN conda env create -f /tmp/deployment_environment.yaml

RUN conda init && \
    echo "conda activate vint_deployment" >> ~/.bashrc
    # pip install -e train/

RUN echo "source /opt/ros/noetic/setup.bash " >> ~/.bashrc && \
    echo "source /workspace/catkin_ws/devel/setup.bash " >> ~/.bashrc


COPY ./setup.sh /tmp/setup.sh
# ENTRYPOINT ["/tmp/setup.sh"] 

# RUN git clone https://github.com/YDLIDAR/YDLidar-SDK.git &&\
#     mkdir -p YDLidar-SDK/build && \
#     cd YDLidar-SDK/build &&\
#     cmake ..&&\
#     make &&\
#     make install &&\
#     cd .. &&\
#     pip install . &&\
#     cd .. && rm -r YDLidar-SDK 

# RUN echo "source /opt/ros/foxy/setup.bash" >> /etc/bash.bashrc

# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get update \
#    && apt-get -y install --no-install-recommends ros-foxy-xacro ros-foxy-gazebo* ros-foxy-rviz2* ros-foxy-joint-state-publisher-gui ros-foxy-teleop-twist-keyboard\
#    #
#    # Clean up
#    && apt-get autoremove -y \
#    && apt-get clean -y \
#    && rm -rf /var/lib/apt/lists/*
# ENV DEBIAN_FRONTEND=dialog  




# RUN echo "source /opt/ros/noetic/setup.bash" >> /etc/bash.bashrc

# ros-foxy-ros1-bridge

# # Install ROS 2 ROS 1 bridge
# RUN echo "alias sr1='source /opt/ros/kinetic/setup.bash'" >> /etc/bash.bashrc
# RUN echo "alias sr2='source /opt/ros/$distro/setup.bash'" >> /etc/bash.bashrc

# RUN cd ~/ros1_ws; source /opt/ros/noetic/setup.bash; catkin_make
# RUN cd ~/ros2_ws; source /opt/ros/foxy/setup.bash; colcon build

# CMD ["bash"]