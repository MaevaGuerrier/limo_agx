#!/bin/bash

source ~/.bashrc

# pip install --upgrade --target=/opt/ros/noetic/lib/limo/color/image_rawpython3/dist-packages rospkg 
# pip3 install rospkg
# pip3 install -e /workspace/visualnav-transformer/deployment/src/train
exec "$@"

# apt update && apt -y install openssh-server
# echo root:"agx" | chpasswd
# service  ssh start
# echo -e "Port 10022\nPermitRootLogin yes\nPermitEmptyPasswords yes" >> /etc/ssh/sshd_config.d/dev.conf
# service ssh restart
# service ssh enable

# # touch /tmp/test.txt

# while sleep 1000; do :; done