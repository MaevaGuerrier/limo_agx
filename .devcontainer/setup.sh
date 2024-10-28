#!/bin/bash

source /opt/ros/noetic/setup.bash
pip install --target=/opt/ros/noetic/lib/limo/color/image_rawpython3/dist-packages rospkg 

exec "$@"

# apt update && apt -y install openssh-server
# echo root:"agx" | chpasswd
# service  ssh start
# echo -e "Port 10022\nPermitRootLogin yes\nPermitEmptyPasswords yes" >> /etc/ssh/sshd_config.d/dev.conf
# service ssh restart
# service ssh enable

# # touch /tmp/test.txt

# while sleep 1000; do :; done