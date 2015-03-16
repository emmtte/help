Raspberry-Service
=================
###Quick Navigation
* [Preparations](#preparations)
 - [Configuration](#configuration)
 - [Updating](#updating)
 - [Secure Shell](#secure-shell)
 - [Prerequisites](#prerequisites)
 - [Midnight commander](#midnight-commander)
 - [Menu](#menu)
* [Tools](#tools)
 - [Loggly](loggly)
 - [nfs](#nfs)
 - [samba](#samba)
 - [tmux](#tmux)
 - [External Usb Drive](#external-usb-drive)
 - [minidlna](#minidlna)
 - [transmission](#transmission)
 - [btsync](#btsync)
 - [motion](#motion)
 - [now.sh](#now.sh)
 - [upload](#upload)
 - [cron](#cron)
 - [GoPro](#gopro)
 - [Format HDD](#format-hdd)
 - [Disable ext4 journal not tested](#disable-ext4-journal-not-tested)
 - [Alias](#alias)
 - [Remove X Server](#remove-x-server)
 - [Fail 2 Ban](#fail-2-ban)
 - [dash to bash and vice cersa](#dash-to-bash-and-vice-cersa)
 - [Repetier-Server](#repetier-server)
* [Third-Party Command Line Utilities](#third-party-command-line-utilities)
 - [Flickr Smart Sync](#flickr-smart-sync)
 - [Google CL](#google-cl)
 - [Picasa Web Uploader](#picasa-web-uploader)
 - [Picasa Web Sync](#picasa-web-sync)
 - [Pushbullet](#pushbullet)
 - [Rclone](#rclone)
 - [Youtube-dl](#youtube-dl)
 - [Youtube-Upload](#youtube-upload)
* [Remote Control with lirc](#remote-control-with-lirc)
 - [Add module](#add-module)
 - [Tests](#tests)
 - [Check](#check)
 - [Reboot](#reboot)
 - [Config](#config)

Preparations
============
Dowload and Install [Win32diskImager](http://sourceforge.net/projects/win32diskimager/files/Archive/win32diskimager-v0.9-binary.zip/download)
Download last [Raspbian](http://downloads.raspberrypi.org/raspbian_latest) realease
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
````
sudo apt-get autoremove
sudo apt-get update
sudo apt-get -y upgrade
sudo rpi-update
````
###Secure Shell
````
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -b 4096 -N '' -C pi@raspberry
mv id_rsa.pub authorized_keys
sudo chmod 600 authorized_keys
cat << EOF | sudo tee -a /etc/ssh/sshd_config
AuthorizedKeysFile /home/pi/.ssh/authorized_keys
PasswordAuthentication no
Match Address 192.168.0.0/24
    PasswordAuthentication yes
EOF
sudo service ssh restart
````
###Prerequisites
````
sudo apt-get install tmux exif mencoder
mkdir /home/pi/service/
cd /home/pi/service/
touch 3rd_party backup system tmux update
````
### Midnight commander
````
sudo apt-get remove mc
sudo apt-get install libglib2.0-dev libslang2-dev
wget http://ftp.midnight-commander.org/mc-4.8.13.tar.bz2
bzip2 -cd mc-4.8.13.tar.bz2 | tar xvf -
cd mc-4.8.13
./configure
make
sudo make install

echo "export EDITOR=/usr/local/bin/mcedit" >> ~/.profile
````
### Menu
````
curl -o ~/.config/mc/menu https://raw.githubusercontent.com/ManuCart/ServicePi/master/menu
alias mc='mc /home/pi/service'
echo "alias mc='mc /home/pi/service'" >> ~/.profile
source ~/.profile
````

Tools
=====
###Loggly
https://raspberry.loggly.com/sources/setup/linux
### nfs
````
sudo chmod -R 777 /media/hdd
sudo apt-get install nfs-kernel-server
add in
sudo nano /etc/exports
this
/media/hdd *(rw,all_squash,no_subtree_check,anonuid=1000,anongid=1000,sync)
sudo exportfs -ra

A verifier
sudo exportfs -ra
sudo /etc/init.d/nfs-kernel-server start
sudo update-rc.d rpcbind enable
sudo service rpcbind restart
sudo service nfs-kernel-server restart
````
### samba
````
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
[PI]
comment = Raspberry Pi Hard Drive
path = /home/pi
valid users = @users
force group = users
create mask = 0660
directory mask = 0771
read only = no
EOF
sudo service samba restart
sudo smbpasswd -a pi
````
### tmux
````
sudo apt-get -y install tmux
tmux new -s session_name creates a new tmux session named session_name
tmux attach -t session_name attaches to an existing tmux session named session_name
tmux switch -t session_name switches to an existing session named session_name
tmux list-sessions lists existing tmux sessions
tmux detach (ctrl b + d) detach the currently attached session
````
### External Usb Drive
````
sudo mkdir /media/hdd
sudo e2label /dev/sda1 RaspberryPi
sudo mount LABEL=RaspberryPi /media/hdd
echo 'LABEL="RaspberryPi" /media/hdd ext4 noatime 0 2' | sudo tee -a /etc/fstab
sudo chown -R pi:pi /media/hdd
````
### minidlna
```
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
### transmission
```
sudo apt-get -y install transmission-daemon
mkdir /media/hdd/torrent
sudo usermod -a -G debian-transmission pi
sudo chgrp debian-transmission /media/hdd/torrent
sudo chmod 777 -R /media/hdd/torrent
sudo service transmission-daemon reload
```
```
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
### btsync
````
cd /tmp
curl -o btsync.tar.gz https://download-cdn.getsyncapp.com/stable/linux-arm/BitTorrent-Sync_arm.tar.gz
tar -xvf btsync.tar.gz
sudo mv btsync /usr/bin
sudo chmod 755 /usr/bin/btsync
sudo btsync
````
### motion
````
echo 'disable_camera_led=1' | sudo tee -a /boot/config.txt
````
````
sudo modprobe bcm2835-v4l2
echo 'bcm2835-v4l2' | sudo tee -a /etc/modules
sudo apt-get install motion
sudo chmod 664 /etc/motion/motion.conf
````
````
mkdir /tmp/motion
````
````
echo 'start_motion_daemon=no' | sudo tee /etc/default/motion
````
````
sudo mcedit /etc/motion/motion.conf
````
````
process_id_file /var/run/motion.pid
ffmpeg_cap_new off
width 1280
height 720
webcam_localhost off
target_dir /tmp/motion
control_localhost off
on_event_start /usr/bin/pushbullet push all note "%d/%m/%Y %H:%M:%S motion detected"
````
###now.sh
````
#!/bin/bash
if /bin/ping -c 1 192.168.0.8
  then
    if pgrep motion
         then logger -p warn -t now "ping is ok and shutdown motion"
        killall motion
         else logger -p warn -t now "ping is ok and nothing to do"
    fi
    else
    if pgrep motion
        then logger -p warn -t now "ping is not ok and nothing to do motion already up"
        else logger -p warn -t now "ping is not ok and motion is starting now"
        motion
    fi
fi
````
###upload
````
````
### cron
````
apt-get install inotify-tools
echo "*/5 * * * * /home/pi/now.sh >/dev/null 2>&1"
echo "@reboot /home/pi/remote.sh >>/dev/null 2>&1"
* * * * * root  /usr/bin/flock -xn /var/lock/script.lock -c '/bin/bash updb.sh'
crontab /tmp/cron.tmp
sudo service cron restart
````
### GoPro
````
sudo mkdir /media/gopro
sudo mount /dev/sdb1 /media/gopro
````    
### Format HDD
````
sudo mkfs.ext4 /dev/sda1 -L RaspberryPi
sudo e2label /dev/sda1 RaspberryPi
sudo mount LABEL=RaspberryPi /media/hdd
````
### Disable ext4 journal (not tested)
````
tune4fs -O ^has_journal /dev/sdaX
e4fsck –f /dev/sdaX
sudo reboot
````    
### Alias
````
echo "alias smc='sudo mc'" >> ~/.bashrc
````
### Remove X Server
````
sudo apt-get remove --auto-remove --purge libx11-.*
````
### Fail 2 Ban
````
sudo apt-get install fail2ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo service fail2ban restart
````
### dash to bash and vice cersa
````
sudo ln -sf bash /bin/sh
sudo ln -sf dash /bin/sh
````
### Repetier-Server
````
curl -o ~/RepetierServer0.51.1.deb http://www.repetier-server.com/en/?wpdmdl=187
sudo dpkg -i RepetierServer0.51.1.deb
# Start server
/etc/init.d/RepetierServer start
# Stop server
/etc/init.d/RepetierServer stop
# Restart server
/etc/init.d/RepetierServer restart
````


Third-Party Command Line Utilities
==================================
### Flickr Smart Sync
https://github.com/faisalraja/flickrsmartsync
````
sudo apt-get install python-dev python-setuptools
git clone https://github.com/faisalraja/flickrsmartsync.git
cd flickrsmartsync
sudo python setup.py install
sudo rm /home/pi/flickrsmartsync
flickrsmartsync --sync-path /media/hdd/photos
`````
### Google CL
https://github.com/vinitkumar/googlecl
````
git clone https://github.com/vinitkumar/googlecl.git
cd googlecl
sudo python setup.py install
````
### Picasa Web Uploader
https://github.com/jackpal/picasawebuploader
`````
sudo apt-get install python-pip
sudo apt-get install libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev
sudo pip install pil
sudo pip install gdata
sudo apt-get install python-pyexiv2
curl -o picasawebuploader.py https://raw.githubusercontent.com/jackpal/picasawebuploader/master/main.py
sudo chmod +x picasawebuploader.py 
picasawebuploader.py --email @gmail.com --source /media/hdd/photos
`````
### Picasa Web Sync
https://github.com/leocrawford/picasawebsync
`````
sudo apt-get install jhead
sudo apt-get install python-imaging python-imaging-tk
sudo apt-get install python-gdata
git clone https://github.com/leocrawford/picasawebsync.git
cd picasawebsync
sudo python setup.py install
picasawebsync.py -d /media/hdd/photos --shrink
`````
### Pushbullet
https://github.com/Red5d/pushbullet-bash
````
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/pushbullet -o /usr/bin/pushbullet
sudo chmod a+x /usr/bin/pushbullet
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/JSON.sh -o /usr/bin/JSON.sh
sudo chmod a+x /usr/bin/JSON.sh
echo "API_KEY=ABCDEFGHIJKLMNOPQRSTUVWXYZ" > ~/.config/pushbullet
````
### Rclone
https://github.com/ncw/rclone
````
curl -o rclone.zip http://downloads.rclone.org/rclone-v1.07-linux-arm.zip
unzip rclone.zip
sudo cp rclone-v1.05-linux-arm/rclone /usr/bin/rclone
rclone config
rclone sync gdrive:/Photos_Old pi:/media/hdd/rclone
````
### Youtube-dl
https://github.com/rg3/youtube-dl
````
sudo curl https://yt-dl.org/latest/youtube-dl -o /usr/bin/youtube-dl
sudo chmod a+x /usr/bin/youtube-dl
````
### Youtube-Upload
https://github.com/tokland/youtube-upload
````
sudo easy_install --upgrade google-api-python-client
wget https://github.com/tokland/youtube-upload/archive/master.zip
unzip master.zip
cd youtube-upload-master
sudo python setup.py install
````
````
mv youtube.json /home/pi/.config/youtube.json
youtube-upload --title="test" --category="Music" --privacy="private" --location="=" --client-secrets="/home/pi/.config/youtube.json" "/media/hdd/gopro/videos/youtube.avi"
````
Remote Control with lirc
========================
[Schematics](https://upverter.com/ManuCart/cb215faab64eae4f/Raspberry-Pi-with-Seeds-Grove---Infrared-Emitter/)

###Add module
```
cat << EOF | sudo tee -a /etc/modules
lirc_dev
lirc_rpi gpio_in_pin=23 gpio_out_pin=22
EOF
```
###Installation

    sudo apt-get install -y lirc
###Tests
````
sudo service lirc stop
mode2 -d /dev/lirc0
sudo service lirc start
irw
````
###Check ```/etc/lirc/hardware.conf``` file
```sudo mcedit /etc/lirc/hardware.conf```
```
# /etc/lirc/hardware.conf
#
# Arguments which will be used when launching lircd
LIRCD_ARGS="--uinput"

# Don't start lircmd even if there seems to be a good config file
# START_LIRCMD=false

# Don't start irexec, even if a good config file seems to exist.
# START_IREXEC=false

# Try to load appropriate kernel modules
LOAD_MODULES=true

# Run "lircd --driver=help" for a list of supported drivers.
DRIVER="default"
# usually /dev/lirc0 is the correct setting for systems using udev
DEVICE="/dev/lirc0"
MODULES="lirc_rpi"

# Default configuration files for your hardware if any
LIRCD_CONF=""
LIRCMD_CONF=""
```
###Reboot
```
sudo reboot
```
###Config new remote control
```
sudo /etc/init.d/lirc stop
irrecord -n -d /dev/lirc0 tv
irrecord -n -d /dev/lirc0 hifi
cat tv hifi > lircd.conf
sudo cp lircd.conf /etc/lirc/lircd.conf
```
###Use already remote control
```
wget -O lircd.conf https://github.com/ManuCart/Raspberry-Installation/raw/master/lirc/Z5400.conf
sudo cp lircd.conf /etc/lirc/lircd.conf
```
```
sudo service lirc start
sudo service lirc stop
```
###OMXPlayer on Raspberry PI

Status

    tvservice -s
    
Help

http://www.raspberrypi.org/phpBB3/viewtopic.php?t=5851
    
Configuration

    cat << EOF | sudo tee -a /boot/config.txt
    hdmi_group=1 #CEA
    hdmi_mode=19 #720p50
    hdmi_force_hotplug=1
    EOF

Utilisation

    dd if=/dev/zero of=/dev/fb0
    tvservice -p #Start HDMI preferd
    omxplayer /media/hdd1/omx/test.mkv
    tvservice -o #Shutdown HDMI

