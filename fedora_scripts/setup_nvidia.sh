# NVIDIA driver setup script for Fedora
#!/bin/bash

sudo dnf update -y # and reboot if you are not on the latest kernel
sudo dnf install akmod-nvidia # rhel/centos users can use kmod-nvidia instead
sudo dnf install xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support

sudo dnf mark user akmod-nvidia

sudo dnf install vulkan

sudo dnf install xorg-x11-drv-nvidia-cuda-libs

sudo dnf install nvidia-vaapi-driver libva-utils vdpauinfo

