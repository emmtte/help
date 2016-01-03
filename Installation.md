Raspberry Pi
============

Raspbian Installation
---------------------
Dowload and Install [Win32diskImager](http://sourceforge.net/projects/win32diskimager/files/Archive/win32diskimager-v0.9-binary.zip/download)

Download Raspbian lite [Raspbian](https://downloads.raspberrypi.org/raspbian_lite_latest) realease

###First  start
Download putty and write
`start /MAX putty -ssh pi@192.168.0.1`

###Configuration
````
sudo raspi-config
> Expand Filesystem
> Internationalisation Options
 - Change Locale add [*] fr_FR.UTF-8 UTF-8
 - Default locale for the system environement : fr_FR.UTF-8
 - Change Timezone with Geographic area : Europe and Time zone : Paris
> Enable Camera
> Overclock
 - Medium
> Reboot
````
###Updating
```shell
sudo apt-get autoremove
sudo apt-get update
sudo apt-get -y upgrade
sudo rpi-update
```

### Menu
````shell
sudo apt-get install mc tmux exif mpv imagemagick
mkdir /home/pi/service/
cd /home/pi/service/
curl -o ~/.config/mc/menu https://raw.githubusercontent.com/ManuCart/ServicePi/master/menu
````

:memo: .bash_profile
````shell
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
if [ -z "$TMUX" ]; then
    mc /home/pi/service/ /home/pi/service/gdrive
fi
````


````
cp /etc/mc/mc.keymap ~/.config/mc/
mcedit ~/.config/mc/mc.keymap
````
:memo: ~/.config/mc/mc.keymap
````shell
UserMenu = f2; ctrl-w
Mark = insert; ctrl-t; ctrl-b
````
:memo:**````mcedit ~/.tmux.conf````**
````shell
unbind C-b
set -g prefix Tab
bind Tab send-prefix

bind-key C-b next-window
bind-key C-w previous-window
bind-key Escape detach-client

set -g base-index 1

set -g mode-mouse on
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on

set-option -g status-right ''
````

### External Usb Drive and Freebox HDD
````shell
sudo mkfs.ext4 /dev/sda1 -L RaspberryPi
sudo e2label /dev/sda1 RaspberryPi
sudo mkdir /media/hdd
sudo mount LABEL=RaspberryPi /media/hdd

sudo mount -t cifs //mafreebox.freebox.fr/Server\ Freebox/ /media/freebox -o user=freebox,password=mini4K,uid=1000,gid=1000,rw,sec=ntlm

echo 'LABEL="RaspberryPi" /media/hdd ext4 noatime 0 2' | sudo tee -a /etc/fstab
echo '//mafreebox.freebox.fr/Server\ Freebox/ /media/freebox cifs _netdev,rw,user=freebox,password=mini4K,iocharset=utf8,uid=1000,sec=none,file_mode=0777,dir_mode=0777 0 0' | sudo tee -a /etc/fstab
sudo chown -R pi:pi /media/hdd

sudo mkdir /media/gopro
sudo mount /dev/sdb1 /media/gopro
````

### Btsync
https://www.getsync.com/intl/fr/
````shell
cd /tmp
curl -k -o btsync.tar.gz https://download-cdn.getsyncapp.com/stable/linux-arm/BitTorrent-Sync_arm.tar.gz
tar -xvf btsync.tar.gz
sudo mv btsync /usr/bin
sudo chmod 755 /usr/bin/btsync
sudo btsync
````
