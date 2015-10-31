Raspberry-Service
=================

Preparations
============
Dowload and Install [Win32diskImager](http://sourceforge.net/projects/win32diskimager/files/Archive/win32diskimager-v0.9-binary.zip/download)
Download last [Raspbian](http://downloads.raspberrypi.org/raspbian_latest) realease

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
````
sudo apt-get autoremove
sudo apt-get update
sudo apt-get -y upgrade
sudo rpi-update
````
###Secure Shell
http://www.openssh.com/
````
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
````
### Menu
````
sudo apt-get install mc tmux exif mpv imagemagick
mkdir /home/pi/service/
cd /home/pi/service/
touch 3rd_party backup system tmux update
curl -o ~/.config/mc/menu https://raw.githubusercontent.com/ManuCart/ServicePi/master/menu


alias mc='mc /home/pi/service'
echo "alias mc='mc /home/pi/service'" >> ~/.profile
source ~/.profile
echo "export EDITOR=/usr/local/bin/mcedit" >> ~/.profile

````
### samba
https://www.samba.org/
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
sudo service smbd restart
sudo smbpasswd -a pi
````
### tmux
https://tmux.github.io/
````
sudo apt-get -y install tmux
echo 'set-option -g history-limit 2000' | sudo tee /home/pi/.tmux.conf
tmux new -s session_name creates a new tmux session named session_name
tmux attach -t session_name attaches to an existing tmux session named session_name
tmux switch -t session_name switches to an existing session named session_name
tmux list-sessions lists existing tmux sessions
````
<p>detach the currently attached session <kbd>Ctrl</kbd><kbd>b</kbd>+<kbd>d</kbd></p>
<p>scroll inside tmux session <kbd>Ctrl</kbd><kbd>b</kbd>+<kbd>[</kbd></p>
### External Usb Drive and Freebox HDD
````
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
### mpd
http://www.musicpd.org/
```
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
### Btsync
https://www.getsync.com/intl/fr/
````
cd /tmp
curl -k -o btsync.tar.gz https://download-cdn.getsyncapp.com/stable/linux-arm/BitTorrent-Sync_arm.tar.gz
tar -xvf btsync.tar.gz
sudo mv btsync /usr/bin
sudo chmod 755 /usr/bin/btsync
sudo btsync
````
### Motion
http://www.lavrsen.dk/foswiki/bin/view/Motion/WebHome
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
on_picture_save /usr/bin/dropbox_uploader upload %f /motion/%d-%m-%Y/%H-%M-%S.jpg
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
### Squid
http://www.squid-cache.org/
````
sudo apt-get install squid
sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.origin
sudo mcedit squid.conf

 ## disable ads ( http://pgl.yoyo.org/adservers/ )
 acl ads dstdom_regex "/etc/squid/ad_block.txt"
 http_access deny ads
 deny_info TCP_RESET ads

sudo wget -O /etc/squid/ad_block.txt 'http://pgl.yoyo.org/adservers/serverlist.php?hostformat=nohtml'
sudo squid -k reconfigure
````
