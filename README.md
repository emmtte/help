
Command Line Interface Tools
============================
  + [Ansi](#ansi)
  + [Castnow](#castnow)
  + [Dropbox-Uploader](#dropbox-uploader)
  + [Drive](#drive)
  + [Flickr-Uploader](#flickr-uploader)
  + [Gmusic](#gmusicapi-scripts)
  + [Hue](#hue-cli)
  + [Ifttt](#ifttt)
    - [Adafruit Channel](#adafruit-channel)
    - [Maker Channel](#maker-channel)
  + [Iphone](#iphone)
  + [Keeweb](#keeweb)
  + [Midnight Commander](#midnight-commander)
  + [Motion](#motion)
  + [Mosquitto](#mosquitto)
  + [OpenSSH](#open-ssh)
  + [Picasa Websync](#picasa-websync)
  + [Pi Hole](#pi-hole)
  + [Pushbullet](#pushbullet)
  + [Raspbian](#raspbian)
  + [Samba](#samba)
  + [Sejda](#sejda)
  + [Squid](#squid)
  + [Telegram](#telegram)
  + [Transmission](#transmission)
  + [Youtube-dl](#youtube-dl)
  + [Youtube-Upload](#youtube-upload)

<br><br>

Ansi
----
:link: https://github.com/fidian/ansi
```shell
curl -OL git.io/ansi
chmod 755 ansi
sudo mv ansi /usr/local/bin/
```
[:back:](#command-line-interface-tools)

<br><br>

Castnow
-------
:link: https://github.com/xat/castnow
```shell
wget https://nodejs.org/dist/v6.2.0/node-v6.2.0-linux-armv6l.tar.gz
tar -xvf node-v6.2.0-linux-armv6l.tar.gz 
cd node-v6.2.0-linux-armv6l
sudo cp -R * /usr/local/
sudo npm install castnow -g
castnow http://hi5.streamingsoundtracks.com --type "audio/wav"
```
[`castnow-start`](https://github.com/ManuCart/RaspberryPi/blob/master/scripts/castnow-start)
[`castnow-stop`](https://github.com/ManuCart/RaspberryPi/blob/master/scripts/castnow-stop)
[:back:](#command-line-interface-tools)
<br><br>

Dropbox-Uploader
----------------
:link: https://github.com/andreafabrizi/Dropbox-Uploader
```shell
sudo curl -o /usr/local/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/local/bin/dropbox_uploader
dropbox_uploader init
```
[:back:](#command-line-interface-tools)
<br><br>

Drive
-----
:link: https://github.com/odeke-em/drive

:link: https://golang.org/dl/
```shell
curl -L -o go1.6.2.linux-armv6l.tar.gz https://storage.googleapis.com/golang/go1.6.2.linux-armv6l.tar.gz
sudo tar -C /usr/local -xzf go1.6.2.linux-armv6l.tar.gz
export PATH=$PATH:/usr/local/go/bin
cat << ! >> ~/.bashrc
export GOPATH=~/.bin/go
export PATH=\$GOPATH:\$GOPATH/bin:\$PATH
!
source ~/.bashrc
mkdir ~/.bin ~/.bin/go
go get -u github.com/odeke-em/drive/cmd/drive
drive init /media/hdd/Drive
```
[:back:](#command-line-interface-tools)
<br><br>

Flickr-Uploader
---------------
:link: https://github.com/trickortweak/flickr-uploader
> Do first time without tmux script for token

```shell
sudo apt-get remove elinks links links2 lynx w3m
cd ~/.bin
git clone https://github.com/trickortweak/flickr-uploader.git
chmod +x flickr-uploader/uploadr.py
mcedit flickr-uploader/uploadr.ini
 > FILES_DIR = "/media/hdd/photos"
 > "api_key" : "********************************",
 > "secret"  : "****************"
mv flickr-uploader/ flickr-uploader#1/
cd ~
~/.bin/flickr-uploader#1/uploadr.py
```
[:back:](#command-line-interface-tools)
<br><br>

Gmusicapi-scripts
-----------------
:link:https://github.com/thebigmunch/gmusicapi-scripts
```Shell
sudo easy_install3 -U pip
sudo pip3 install --upgrade gmusicapi-scripts
gmsync /media/hdd/music
gmsync down "/media/hdd/listen/%album%/%title%"
gmsync -c ~/.local/share/gmusicapi/oauth.2.cred /media/hdd/music
```
[:back:](#command-line-interface-tools)
<br><br>

Hue-cli
-------
:link:https://github.com/bahamas10/hue-cli
```Shell
sudo npm install -g hue-cli
hue search
hue -H 192.168.0.10 register
hue lights 6 on
hue lights 6 ff0000
hue lights 6 off
hue lights 6 alert
```
[:back:](#command-line-interface-tools)
<br><br>

Ifttt
-----
:link: https://ifttt.com

### Adafruit Channel
:link: https://ifttt.com/adafruit
````
echo "{key}" > ~/.AIO_KEY
mosquitto_pub -h io.adafruit.com -p 8883 -u rpi_home -P `cat ~/.AIO_KEY` -t rpi_home -m test
mosquitto_pub -h io.adafruit.com -p 1883 -u rpi_home -P `cat ~/.AIO_KEY` -t rpi_home/f/rpi -m "test"
mosquitto_sub -h io.adafruit.com -p 1883 -u rpi_home -P `cat ~/.AIO_KEY` -t rpi_home/# -R | jq '.'
mosquitto_sub -h io.adafruit.com -p 1883 -u rpi_home -P `cat ~/.AIO_KEY` -t rpi_home/# -R | jq --raw-output '.value'
mosquitto_sub -h io.adafruit.com -p 1883 -u rpi_home -P `cat ~/.AIO_KEY` -t rpi_home/# -R | jq --raw-output 'select(.value != null).value'
````

### Maker Channel
:link: https://ifttt.com/maker
````
echo "{key}" > ~/.maker_channel_key
curl -X POST https://maker.ifttt.com/trigger/Raspberry_Pi/with/key/`cat ~/.maker_channel_key`
curl -X POST -H "Content-Type: application/json" -d '{"value1":"1","value2":"2","value3":"3"}' https://maker.ifttt.com/trigger/Raspberry_Pi/with/key/`cat ~/.maker_channel_key`
````
[:back:](#command-line-interface-tools)
<br><br>

Iphone
------
:link:https://github.com/libimobiledevice
<br>
:link:https://gist.github.com/kfatehi/8922430
````
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install git build-essential libxml2-dev python2.7 python2.7-dev fuse libtool autoconf libusb-1.0-0-dev libfuse-dev
mkdir iphone_libs && cd iphone_libs

git clone https://github.com/libimobiledevice/libplist.git
git clone https://github.com/libimobiledevice/libusbmuxd.git
git clone https://github.com/libimobiledevice/usbmuxd.git
git clone https://github.com/libimobiledevice/libimobiledevice.git
git clone https://github.com/libimobiledevice/ifuse.git

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
echo "export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig" | sudo tee -a /etc/bash.bashrc

cd libplist && ./autogen.sh && make && sudo make install && cd ..
cd libusbmuxd && ./autogen.sh && make && sudo make install && cd ..
cd libimobiledevice && ./autogen.sh && make && sudo make install && cd ..
cd usbmuxd && ./autogen.sh && make && sudo make install && cd ..
cd ifuse && ./autogen.sh && make && sudo make install && cd ..

groupadd -g 140 usbmux &>/dev/null
useradd -c 'usbmux user' -u 140 -g usbmux -d / -s /sbin/nologin usbmux &>/dev/null
passwd -l usbmux &>/dev/null

echo /usr/local/lib | sudo tee /etc/ld.so.conf.d/libimobiledevice-libs.conf
sudo ldconfig
````
[:back:](#command-line-interface-tools)
<br><br>

Keeweb
------
:link: https://github.com/keeweb/keeweb

:information_source: https://github.com/ManuCart/RaspberryPi/blob/master/scripts/install-keeweb
[:back:](#command-line-interface-tools)
<br><br>

Midnight Commander
------------------
```shell
sudo apt-get -y install mc tmux
mkdir ~/scripts/
cd ~/scripts/
curl -o ~/scripts/update-scripts https://raw.githubusercontent.com/ManuCart/RaspberryPi/master/scripts/update-scripts
chmod +x ~/scripts/*
```
[:back:](#command-line-interface-tools)
<br><br>

Motion
------
:link: http://www.lavrsen.dk/foswiki/bin/view/Motion/WebHome
```shell
echo 'disable_camera_led=1' | sudo tee -a /boot/config.txt
sudo modprobe bcm2835-v4l2
echo 'bcm2835-v4l2' | sudo tee -a /etc/modules
sudo apt-get -y install motion
sudo chmod 664 /etc/motion/motion.conf
mkdir /tmp/motion
echo 'start_motion_daemon=no' | sudo tee /etc/default/motion
```
```shell
sudo mcedit /etc/motion/motion.conf
```
````
daemon off
process_id_file /var/run/motion/motion.pid
ffmpeg_output_movies off
rotate 270
width 1280
height 960
threshold 3000
webcam_localhost off
target_dir /media/hdd/motion
control_localhost off
on_event_start /usr/local/bin/pushbullet push all note "%d/%m/%Y %H:%M:%S motion detected"
on_picture_save /usr/local/bin/dropbox_uploader upload %f /motion/%d-%m-%Y/%H-%M-%S.jpg
````
````
sudo mkdir /var/run/motion
sudo chmod 777 /var/run/motion
````
[:back:](#command-line-interface-tools)
<br><br>

Mosquitto
---------
:link:https://mosquitto.org/
````
curl -O http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
sudo apt-key add mosquitto-repo.gpg.key
rm mosquitto-repo.gpg.key
cd /etc/apt/sources.list.d/
sudo wget http://repo.mosquitto.org/debian/mosquitto-jessie.list
sudo apt-get update
````
[:back:](#command-line-interface-tools)
<br><br>

Open SSH
--------
:link: http://www.openssh.com/
```shell
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -b 4096 -N '' -C pi@raspberry
mv id_rsa.pub authorized_keys
sudo chmod 600 authorized_keys
```
or
```
mkdir ~/.ssh
cd ~/.ssh
dropbox_uploader download id_rsa.pub
mv id_rsa.pub authorized_keys
sudo chmod 600 authorized_keys
```
```
cat << EOF | sudo tee -a /etc/ssh/sshd_config
PermitRootLogin no
AuthorizedKeysFile /home/pi/.ssh/authorized_keys
PasswordAuthentication no
Match Address 127.0.0.1,192.168.0.0/24
    PasswordAuthentication yes
EOF
sudo service ssh restart
```
[:back:](#command-line-interface-tools)
<br><br>

Picasa Websync
--------------
:link: https://github.com/leocrawford/picasawebsync
```shell
sudo apt-get install jhead
sudo apt-get install python-imaging python-imaging-tk
sudo apt-get install python-gdata
sudo pip install --upgrade oauth2client
mkdir ~/.bin/picasa-websync#1 ~/.bin/picasa-websync#2
curl -o ~/.bin/picasawebsync.py https://raw.githubusercontent.com/leocrawford/picasawebsync/master/picasawebsync.py
chmod +x ~/.bin/picasawebsync.py
cp ~/.bin/picasawebsync.py ~/.bin/picasa-websync#1/picasawebsync.py
mv ~/.bin/picasawebsync.py ~/.bin/picasa-websync#2/picasawebsync.py
cp client_secrets.json ~/.bin/picasa-websync#1/client_secrets.json
cp client_secrets.json ~/.bin/picasa-websync#2/client_secrets.json
```
[:back:](#command-line-interface-tools)
<br><br>

Pi Hole
-------
:link: https://github.com/jacobsalmela/pi-hole
```shell
curl -sSL https://install.pi-hole.net | bash
sudo mcedit /etc/dnsmasq.d/02-wildcards.conf
> address=/.blub.com/192.168.0.1
> address=/.blub.net/192.168.0.1
sudo reboot
```
[:back:](#command-line-interface-tools)
<br><br>

Pushbullet-cli
--------------
:link: https://github.com/r-darwish/pushbullet-cli
```shell
https://github.com/r-darwish/pushbullet-cli
git clone https://github.com/r-darwish/pushbullet-cli.git
cd pushbullet-cli
sudo python setup.py install
cd ..
sudo rm -rf pushbullet-cli
pb set-key
```
[:back:](#command-line-interface-tools)
<br><br>

Pushbullet
----------
:link: https://github.com/Red5d/pushbullet-bash
```shell
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/pushbullet -o /usr/local/bin/pushbullet
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/JSON.sh -o /usr/local/bin/JSON.sh
sudo chmod +x /usr/local/bin/pushbullet /usr/local/bin/JSON.sh
```
:bangbang: https://www.pushbullet.com/account
```shell
echo "PB_API_KEY=ABCDEFGHIJKLMNOPQRSTUVWXYZ" > ~/.config/pushbullet
```
[:back:](#command-line-interface-tools)
<br><br>

Raspbian
--------
:link: https://www.raspberrypi.org/downloads/raspbian/

Dowload and Install [Win32diskImager](http://sourceforge.net/projects/win32diskimager/files/Archive/win32diskimager-v0.9-binary.zip/download)

Download Raspbian lite [Raspbian](https://downloads.raspberrypi.org/raspbian_lite_latest) realease

SSH disabled by default; can be enabled by creating a file with name "ssh" in boot partition

Download putty and write
`start /MAX putty -ssh pi@192.168.0.1`

Configuration
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
Updating
```shell
sudo apt-get autoremove
sudo apt-get update
sudo apt-get -y upgrade
sudo rpi-update
```
[:back:](#command-line-interface-tools)
<br><br>

Samba
-----
:link: https://www.samba.org/
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
sudo service smbd restart
sudo smbpasswd -a pi
````
[:back:](#command-line-interface-tools)
<br><br>

Sejda
-----
:link: https://github.com/torakiki/sejda
```shell
sudo apt-get -y install oracle-java8-jdk
curl -L -o sejda.zip https://github.com/torakiki/sejda/releases/download/v1.0.0.RELEASE/sejda-console-1.0.0.RELEASE-bin.zip
curl -L -o sejda.zip https://github.com/torakiki/sejda/releases/download/v2.0.0.M8/sejda-console-2.0.0.M8-bin.zip
unzip sejda.zip
mkdir ~/.bin/sejda
mv sejda-console-1.0.0.RELEASE/* ~/.bin/sejda
rm sejda.zip
chmod +x ~/.bin/sejda/bin/sejda-console
```
[:back:](#command-line-interface-tools)
<br><br>

Squid
-----
:link: http://www.squid-cache.org/
```shell
sudo apt-get install squid
sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.origin
sudo mcedit squid.conf

 ## disable ads ( http://pgl.yoyo.org/adservers/ )
 acl ads dstdom_regex "/etc/squid/ad_block.txt"
 http_access deny ads
 deny_info TCP_RESET ads

sudo wget -O /etc/squid/ad_block.txt 'http://pgl.yoyo.org/adservers/serverlist.php?hostformat=nohtml'
sudo squid -k reconfigure
```
[:back:](#command-line-interface-tools)
<br><br>

Telegram
--------
:link: https://github.com/vysheng/tg
```shell
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev libjansson-dev libpython-dev make 
git clone --recursive https://github.com/vysheng/tg.git
cd tg
./configure
make

If error
mcedit tgl/mtproto-utils.c
comment lines 101, 108, 116 and 122 with assert (0) 
make

sudo cp ~/tg/bin/telegram-cli /usr/bin  
sudo mkdir -p /etc/telegram-cli  
sudo mv ~/tg/tg-server.pub /etc/telegram-cli/server.pub 

~/tg/bin/telegram-cli -b bot -s ~/scripts/tg.lua
```
[:back:](#command-line-interface-tools)
<br><br>

Transmission
------------
:link: http://www.transmissionbt.com/
```shell
sudo apt-get -y install transmission-daemon
mkdir /media/hdd/torrents
sudo usermod -a -G debian-transmission pi
sudo chgrp debian-transmission /media/hdd/torrents
sudo chmod 777 -R /media/hdd/torrents
sudo mcedit /etc/default/transmission-daemon
>>> ENABLE_DAEMON=0
```
```shell
sudo sed -ie '$d' /etc/transmission-daemon/settings.json
cat << EOF | sudo tee -a /etc/transmission-daemon/settings.json
,
"download-dir": "/media/hdd/torrents" ,
"incomplete-dir": "/media/hdd/torrents" ,
"rpc-authentication-required": false ,
"rpc-whitelist": "127.0.0.1,192.168.0.*" ,
"speed-limit-down": 500 ,
"speed-limit-down-enable": true ,
"speed-limit-up": 10 ,
"speed-limit-up-enable": true ,
"start-added-torrents": true,
"trash-original-torrent-files": true,
"umask": 0 ,
"watch-dir-enabled": true ,
"watch-dir": "/tmp"
}
EOF

sudo service transmission-daemon restart
```

[:back:](#command-line-interface-tools)
<br><br>

Youtube-dl
----------
:link: https://github.com/rg3/youtube-dl
```shell
sudo curl -L https://yt-dl.org/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
echo "<youtube-dl Playlist Link>" > ~/.youtube-dl
mkdir /medi/hdd/youtube-dl
youtube-dl --output "/media/hdd/youtube-dl/%(title)s.%(ext)s" https://www.youtube.com/playlist?list=`cat ~/.youtube-dl`
```
[:back:](#command-line-interface-tools)
<br><br>

Youtube-Upload
--------------
:link: https://github.com/tokland/youtube-upload
```shell
sudo pip install --upgrade google-api-python-client progressbar2
wget https://github.com/tokland/youtube-upload/archive/master.zip
unzip master.zip
cd youtube-upload-master
sudo python setup.py install
```
:bangbang: https://developers.google.com/youtube/registering_an_application
```shell
dropbox_uploader download json/client_secret_youtube.json
sudo mv client_secret_youtube.json /usr/local/share/youtube_upload/client_secrets.json
dropbox_uploader download SampleVideo.mp4
youtube-upload --title="test" --category="Music" --privacy="private" SampleVideo.mp4
```
[:back:](#command-line-interface-tools)
