#!/bin/bash
free -h
sudo swapoff -av ; sudo swapon -av
sudo du -h /var/cache/apt/archives
sudo sync; echo 1 > /proc/sys/vm/drop_caches
sudo sysctl -w vm.drop_caches=1
sudo sync; echo 2 > /proc/sys/vm/drop_caches
sudo sysctl -w vm.drop_caches=2
sudo sync && sudo sysctl -w vm.drop_caches=1
sudo sync && sudo sysctl -w vm.drop_caches=2
sudo apt-get clean && sudo apt-get autoclean
sudo journalctl --disk-usage
sudo journalctl --vacuum-time=30d
sudo du -sh ~/.cache/thumbnails
sudo rm -rf ~/.cache/thumbnails/*
sudo rm -rf /home/$USER/.local/share/Trash/files/*
sudo rm -rf /var/tmp/*
sudo apt-get clean
sudo apt-get autoclean
sudo rm -r /var/lib/dpkg/info
sudo rm -r /var/cache/apt/archives
sudo dpkg --configure -a
sudo apt-get -f install
sudo du -h /var/cache/apt/archives
sudo du -sh /var/cache/apt
sudo apt-get update
sudo apt-get upgrade
sudo apt-get full-upgrade
sudo apt-get dist-upgrade
#optional to update grub, just uncomment the (#)
#sudo update-grub
#sudo grub-mkconfig -o /boot/grub/grub.cfg
