#!/bin/bash
apt-get update
apt-get install python -y
sudo adduser ubuntu --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
usermod -aG sudo ubuntu
cp -r /root/.ssh /home/ubuntu
chown -R ubuntu:ubuntu /home/ubuntu/.ssh