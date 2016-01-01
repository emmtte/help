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
###Secure Shell
http://www.openssh.com/
```shell
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -b 4096 -N '' -C pi@raspberry
mv id_rsa.pub authorized_keys
sudo chmod 600 authorized_keys
cat << EOF | sudo tee -a /etc/ssh/sshd_config
PermitRootLogin no
AuthorizedKeysFile /home/pi/.ssh/authorized_keys
PasswordAuthentication no
Match Address 192.168.0.0/24
    PasswordAuthentication yes
EOF
sudo service ssh restart

cat << EOF | sudo tee -a ~/.bash_profile
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
EOF
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

#### samba
https://www.samba.org/
````shell
sudo apt-get -y install samba samba-common-bin
cat << EOF | sudo tee -a /etc/samba/smb.conf
[HDD]
comment = Raspberry Pi Hard Drive
path = /media/hdd
valid users = @users
force group = users
create mask = 0660
directory mask = 0771
read only = no
EOF
sudo service samba restart
sudo service smbd restart
sudo smbpasswd -a pi
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
### minidlna
http://minidlna.sourceforge.net/
```shell
sudo apt-get -y install minidlna
sudo mcedit /etc/minidlna.conf
```
```
> media_dir=/media/hdd/dlna
> root_container=B
> friendly_name=RaspberryPi
````
````
sudo service minidlna status
sudo service minidlna force-reload
sudo service minidlna start
```
```
?????? sudo chmod 777 -R /media/hdd/
```
### mpd
http://www.musicpd.org/
```shell
sudo apt-get install mpd
sudo mcedit /etc/mpd.conf

music_directory "/media/hdd/music"
bind_to_address "any"
audio_output { device "hw:1,0"    # optional. Keep 0,0 if using the Pi audio }
mixer_type "software"
chmod -R 777 /media/hdd/music/
sudo service mpd restart
```
### Transmission
http://www.transmissionbt.com/
```shell
sudo apt-get -y install transmission-daemon
mkdir /media/hdd/torrent
sudo usermod -a -G debian-transmission pi
sudo chgrp debian-transmission /media/hdd/torrent
sudo chmod 777 -R /media/hdd/torrent
sudo service transmission-daemon reload
```
```shell
sudo sed -ie '$d' /etc/transmission-daemon/settings.json
cat << EOF | sudo tee -a /etc/transmission-daemon/settings.json
,
"download-dir": "/media/hdd/torrent" ,
"incomplete-dir": "/media/hdd/torrent" ,
"rpc-authentication-required": false ,
"rpc-whitelist": "127.0.0.1,192.168.0.*" ,
"speed-limit-down": 500 ,
"speed-limit-down-enable": true ,
"speed-limit-up": 10 ,
"speed-limit-up-enable": true ,
"umask": 0
}
EOF
```
```
sudo service transmission-daemon reload
sudo service transmission-daemon restart
```
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
