Command Line Interface Tools
============================
  + [Castnow](#castnow)
  + [Dropbox-Uploader](#dropbox-uploader)
  + [Drive](#drive)
  + [Flickr-Uploader](#flickr-uploader)
  + [Gmusic](#gmusicapi-scripts)
  + [Hue](#hue-cli)
  + [Ifttt Maker Channel](#ifttt-maker-channel)
  + [Keeweb](#keeweb)
  * [Midnight Commander](#midnight-commander)
  * [Motion](#motion)
  * [Mosquitto](#mosquitto)
  * [OpenSSH](#open-ssh)
  * [Picasa Websync](#picasa-websync)
  * [Pi Hole](#pi-hole)
  * [Pushbullet](#pushbullet)
  * [Raspbian](#raspbian)
  * [Samba](#samba)
  * [Sejda](#sejda)
  * [Squid](#squid)
  * [Transmission](#transmission)
  * [Youtube-dl](#youtube-dl)
  * [Youtube-Upload](#youtube-upload)

Castnow
-------
:link: https://github.com/xat/castnow
```shell
wget https://nodejs.org/dist/v6.2.0/node-v6.2.0-linux-armv6l.tar.gz
tar -xvf node-v6.2.0-linux-armv6l.tar.gz 
cd node-v6.2.0-linux-armv6l
sudo cp -R * /usr/local/
npm install git+https://github.com/xat/castnow.git -g
castnow http://hi5.streamingsoundtracks.com --type "audio/wav"
```

Dropbox-Uploader
----------------
:link: https://github.com/andreafabrizi/Dropbox-Uploader
```shell
sudo curl -o /usr/local/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/local/bin/dropbox_uploader
dropbox_uploader init
```

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

Ifttt Maker Channel
-------------------
:link: https://ifttt.com/maker
````
echo "{key}" > ~/.maker_channel_key
curl -X POST https://maker.ifttt.com/trigger/Raspberry_Pi/with/key/`cat ~/.maker_channel_key`
curl -X POST -H "Content-Type: application/json" -d '{"value1":"1","value2":"2","value3":"3"}' https://maker.ifttt.com/trigger/Raspberry_Pi/with/key/`cat ~/.maker_channel_key`
````

Keeweb
------
:link: https://github.com/keeweb/keeweb

:information_source: https://github.com/ManuCart/RaspberryPi/blob/master/scripts/install-keeweb


Midnight Commander
------------------
```shell
sudo apt-get -y install mc tmux
mkdir ~/scripts/
cd ~/scripts/
curl -o ~/scripts/update-scripts https://raw.githubusercontent.com/ManuCart/RaspberryPi/master/scripts/update-scripts
chmod +x ~/scripts/*
```
.bash_profile
```shell
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
if [ -z "$TMUX" ]; then
    mc /home/pi/scripts/ /media/hdd/Drive/
fi
```
```shell
cp /etc/mc/mc.keymap ~/.config/mc/
mcedit ~/.config/mc/mc.keymap
````
````mcedit ~/.config/mc/mc.keymap````
```shell
UserMenu = f2; ctrl-x
Mark = insert; ctrl-t; ctrl-b
````
**````mcedit ~/.tmux.conf````**
```shell
unbind C-b
set -g prefix Tab
bind Tab send-prefix

bind-key > next-window
bind-key < previous-window
bind-key Escape detach-client

set -g base-index 1
setw -g pane-base-index 1

set -g mode-mouse on
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on

set-option -g status-left  ''
set-option -g status-right ''
```


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

Open SSH
--------
:link: http://www.openssh.com/
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

Picasa Websync
--------------
:link: https://github.com/leocrawford/picasawebsync
```shell
sodo apt-get install jhead
sudo apt-get install python-imaging python-imaging-tk
sudo apt-get install python-gdata
sudo pip install --upgrade oauth2client
curl -o ~/.bin/picasawebsync.py https://raw.githubusercontent.com/leocrawford/picasawebsync/master/picasawebsync.py
chmod +x ~/.bin/picasawebsync.py
cp client_secrets.json ~/.bin/picasawebsync.py
```
demarrer la premiere fois seul dans le repertoire d'installation

Pi Hole
-------
:link: https://github.com/jacobsalmela/pi-hole
```shell
curl -L install.pi-hole.net | bash
sudo mcedit /etc/dnsmasq.d/02-wildcards.conf
> address=/.blub.com/192.168.0.1
> address=/.blub.net/192.168.0.1
sudo reboot
```

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

Raspbian
--------
:link: https://www.raspberrypi.org/downloads/raspbian/

Dowload and Install [Win32diskImager](http://sourceforge.net/projects/win32diskimager/files/Archive/win32diskimager-v0.9-binary.zip/download)

Download Raspbian lite [Raspbian](https://downloads.raspberrypi.org/raspbian_lite_latest) realease

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

Transmission
------------
:link: http://www.transmissionbt.com/
```shell
sudo apt-get -y install transmission-daemon
mkdir /media/hdd/torrent /media/hdd/watch
sudo usermod -a -G debian-transmission pi
sudo chgrp debian-transmission /media/hdd/torrent
sudo chmod 777 -R /media/hdd/torrent
chmod 777 -R /media/hdd/watch
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
"umask": 0 ,
"watch-dir-enabled": true ,
"watch-dir": "/media/hdd/watch"
}
EOF
```
```
sudo service transmission-daemon reload
sudo service transmission-daemon restart
```

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

Youtube-Upload
--------------
:link: https://github.com/tokland/youtube-upload
```shell
sudo pip install --upgrade google-api-python-client progressbar
wget https://github.com/tokland/youtube-upload/archive/master.zip
unzip master.zip
cd youtube-upload-master
sudo python setup.py install
```
:bangbang: https://developers.google.com/youtube/registering_an_application
```shell
dropbox_uploader download client_secret_youtube.json
sudo mv client_secret_youtube.json /usr/local/share/youtube_upload/client_secrets.json
dropbox_uploader download SampleVideo.mp4
youtube-upload --title="test" --category="Music" --privacy="private" SampleVideo.mp4
```
