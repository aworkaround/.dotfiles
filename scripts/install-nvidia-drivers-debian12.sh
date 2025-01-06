#!/bin/bash

sudo apt-key del 7fa2af80
export distro='debian12'
export arch='x86_64'

wget https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda_keyring_1.1-1_all.deb

sudo apt-get update
sudo apt-get install linux-headers-$(uname -r)
sudo add-apt-repository contrib

sudo apt-get --allow-releaseinfo-change update
sudo apt-get -V install nvidia-open -y

sudo apt-get -V install cuda-drivers -y

echo ''
echo 'Done, Please reboot your computer!'
echo ''

