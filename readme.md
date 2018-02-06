
````
    ┌───┐             ┐                   ┌──┐          ┌─┬─┐     ┐           ┐
    │   │             │                   │  │ .        │ │ │ .   │     .     │
    ├──┬┘ ┌─┐ ┌─┐ ┌─┐ ├─┐ ┌─┐ ┌┐ ┌┐ ┐ ┌   ├──┘ ┐        │ │ │ ┐ ┌─┤ ┬─┐ ┐ ┌─┬ ├─┐ ┼
    │  │  ┌─┤ └─┐ │ │ │ │ ├─┘ │  │  │ │   │    │   ──   │ │ │ │ │ │ │ │ │ │ │ │ │ │
    ┴  └┘ └─┴ └─┘ ├─┘ └─┘ ┴─┘ ┴  ┴  └─┤   ┴    ┴        ┴   ┴ ┴ └─┴ ┴ ┴ ┴ └─┤ ┴ ┴ └┘
                  ┴        ──────Menu─┘                     ──────Commander─┘
````
Use Midnight Commander (mc) user menu with tmux for friendly way do some jobs and related stuff

```bash
sudo apt-get install mc sshpass tmux
git clone git@github.com:ManuCart/Raspberry-Pi.git ~/rpi
cd rpi
.\rescue
```

## Tools
### Castnow
https://github.com/xat/castnow

+ Prerequisite [Node.js](#node-js)
```bash
sudo npm install castnow -g
```

### Dropbox-Uploader
https://github.com/andreafabrizi/Dropbox-Uploader
```bash
sudo curl -o /usr/local/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/local/bin/dropbox_uploader
dropbox_uploader init
```

### Drive
https://github.com/odeke-em/drive
+ Prerequisite [Go Lang](#go-lang)
```bash
go get -u github.com/odeke-em/drive/cmd/drive
mkdir /media/hdd/Drive
drive init /media/hdd/Drive
sudo mkdir /opt/gd
sudo chown -R pi:pi /opt/gd
drive init /opt/gd
```

### Flickr-Download
https://github.com/beaufour/flickr-download
```bash
sudo pip install flickr_api
#cd ~/.bin
git clone https://github.com/beaufour/flickr-download.git
~/.bin/flickr-download/flickr_download/flickr_download.py -t 
```

### Flickr-Uploader
https://github.com/trickortweak/flickr-uploader
> Do first time without tmux script for token
```bash
sudo apt-get remove elinks links links2 lynx w3m
sudo mkdir /opt
sudo chown -R pi:pi /opt
cd /opt
git clone https://github.com/trickortweak/flickr-uploader.git
chmod +x flickr-uploader/uploadr.py
mcedit -x flickr-uploader/uploadr.ini
 > FILES_DIR = "/media/hdd/photos"
 > "api_key" : "********************************",
 > "secret"  : "****************"
mv flickr-uploader/ flickr-uploader#1/
cd /opt
/opt/flickr-uploader#1/uploadr.py
```

### Gmusicapi-scripts
https://github.com/thebigmunch/gmusicapi-scripts
+ Prerequisite [Python3](#python3)
```bash
sudo pip3 install gmusicapi-scripts
gmsync /media/hdd/music
gmsync down "/media/hdd/listen/%album%/%title%"
gmsync -c ~/.local/share/gmusicapi/oauth.2.cred /media/hdd/music
```

### Hue-cli
https://github.com/bahamas10/hue-cli
```bash
sudo npm install -g hue-cli
hue search
hue -H 192.168.0.10 register
hue lights 6 on
hue lights 6 ff0000
hue lights 6 off
hue lights 6 alert
```

### Ifttt Maker Channel
https://ifttt.com/maker
```bash
echo "{key}" > ~/.maker_channel_key
curl -X POST https://maker.ifttt.com/trigger/Raspberry_Pi/with/key/`cat ~/.maker_channel_key`
curl -X POST -H "Content-Type: application/json" -d '{"value1":"1","value2":"2","value3":"3"}' https://maker.ifttt.com/trigger/Raspberry_Pi/with/key/`cat ~/.maker_channel_key`
```

### Iphone
https://github.com/libimobiledevice
https://gist.github.com/kfatehi/8922430
```bash
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
```

### Motion
http://www.lavrsen.dk/foswiki/bin/view/Motion/WebHome
```bash
echo 'disable_camera_led=1' | sudo tee -a /boot/config.txt
sudo modprobe bcm2835-v4l2
echo 'bcm2835-v4l2' | sudo tee -a /etc/modules
sudo apt-get -y install motion
sudo chmod 664 /etc/motion/motion.conf
mkdir /tmp/motion
echo 'start_motion_daemon=no' | sudo tee /etc/default/motion

sudo mcedit /etc/motion/motion.conf

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

sudo mkdir /var/run/motion
sudo chmod 777 /var/run/motion
```

### Pi Hole
https://github.com/jacobsalmela/pi-hole
```bash
curl -sSL https://install.pi-hole.net | bash
sudo reboot
```

### Rsync
Virtual Box Installation
```bash
apt-get install sshfs gpm mc
apt-get install gcc make perl linux-headers-$(uname -r)
mkdir --p /media/cdrom
mount -t auto /dev/cdrom /media/cdrom/
cd /media/cdrom/
sh VBoxLinuxAdditions.run
mkdir /media/raspberry
sshfs pi@192.168.0.1:/media/hdd /media/raspberry
rsync /media/raspberry/photos /media/sf_win/Private/Drive/photos
## Windows to Raspberry Pi
rsync --archive --no-o --no-g --delete --info=progress2 -e ssh /media/sf_win/Private/Drive/photos/ pi@192.168.0.1:/media/hdd/photos
## Raspberry Pi to Windows
rsync --archive --no-o --no-g --delete --info=progress2 -e ssh pi@192.168.0.1:/media/hdd/photos/ /media/sf_win/Private/Drive/photos
```

### Sejda
https://github.com/torakiki/sejda
```bash
sudo apt-get -y install oracle-java8-jdk
curl -L -o sejda.zip https://github.com/torakiki/sejda/releases/download/v3.0.18/sejda-console-3.0.18-bin.zip
unzip sejda.zip
sudo mkdir /opt/sejda
sudo chown -R pi:pi /opt/sejda
mv sejda-console-3.0.18/* /opt/sejda/
rm -rf sejda.zip sejda-console-3.0.18
chmod +x /opt/sejda/bin/sejda-console
```

### Sharp
```bash
sudo npm install --unsafe-perm sharp -g sharp-cli
curl https://transfer.sh/XXXXX/20##.####.JPEG -o IMG.JPG
sharp -i IMG.JPG -o IMG.OUT.JPG resize 11900 8400 --withoutEnlargement
curl -H "Max-Downloads: 1" -H "Max-Days: 1" --upload-file ./IMG.OUT.JPG https://transfer.sh/IMG.OUT.JPG && echo
```

### Squid
http://www.squid-cache.org/
```bash
sudo apt-get install squid
```

### Transmission
http://www.transmissionbt.com/
```bash
sudo apt-get -y install transmission-daemon
mkdir /media/hdd/torrents
sudo usermod -a -G debian-transmission pi
sudo chgrp debian-transmission /media/hdd/torrents
sudo chmod 777 -R /media/hdd/torrents
sudo mcedit /etc/default/transmission-daemon
   >>> ENABLE_DAEMON=0
sudo service transmission-daemon stop
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

### Upload-gphotos
https://github.com/3846masa/upload-gphotos
```bash
sudo npm i -g npm
sudo npm install -g upload-gphotos
```

### Youtube-dl
https://github.com/rg3/youtube-dl
```bash
sudo curl -L https://yt-dl.org/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
echo "<youtube-dl Playlist Link>" > ~/.youtube-dl
mkdir /medi/hdd/youtube-dl
youtube-dl --output "/media/hdd/youtube-dl/%(title)s.%(ext)s" https://www.youtube.com/playlist?list=`cat ~/.youtube-dl`
```

### Youtube-Upload
https://github.com/tokland/youtube-upload
```bash
sudo pip install --upgrade google-api-python-client progressbar2
wget https://github.com/tokland/youtube-upload/archive/master.zip
unzip master.zip
cd youtube-upload-master
sudo python setup.py install
rm ~/.youtube-upload-credentials.json
dropbox_uploader download samplevideo.mp4
youtube-upload --title="test" --category="Music" --privacy="private" samplevideo.mp4
cd ..
rm samplevideo.mp4 master.zip
sudo rm -rf youtube-upload-master
```

## Requirements
### Raspbian
https://www.raspberrypi.org/downloads/raspbian/
Download and Install
http://sourceforge.net/projects/win32diskimager/files/Archive/win32diskimager-v0.9-binary.zip/download
Download Raspbian lite
https://downloads.raspberrypi.org/raspbian_lite_latest
Download putty and write

```bash
start /MAX putty -ssh pi@192.168.0.1
```

### Configuration

```bash
sudo raspi-config
```

+ Expand Filesystem
+ Internationalisation Options
  - Change Locale add [*] fr_FR.UTF-8 UTF-8
  - Default locale for the system environement : fr_FR.UTF-8
  - Change Timezone with Geographic area : Europe and Time zone : Paris
+ Enable Camera
+ Overclock
  - Medium
+ Reboot

```bash
sudo apt-get install mc tmux rsync exiv2
sudo ln -sf bash /bin/sh
```

### Updating
```bash
sudo apt-get autoremove
sudo apt-get update
sudo apt-get -y upgrade
sudo rpi-update
```

### Ssh
```bash
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -b 4096 -N '' -C pi@raspberry
mv id_rsa.pub authorized_keys
sudo chmod 600 authorized_keys
cat << EOF | sudo tee -a /etc/ssh/sshd_config
PermitRootLogin no
AuthorizedKeysFile /home/pi/.ssh/authorized_keys
PasswordAuthentication no
Match Address 127.0.0.1,192.168.0.0/24
    PasswordAuthentication yes
EOF
sudo service ssh restart
```

### Samba
```bash
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
```

### Node.js
https://nodejs.org

```bash
wget https://nodejs.org/dist/v8.3.0/node-v8.3.0-linux-armv6l.tar.gz
sudo tar -xvf node-v8.3.0-linux-armv6l.tar.gz --strip 1 -C /usr/local
rm node-v8.3.0-linux-armv6l.tar.gz
```

### Go Lang
https://golang.org/dl/
arm
```bash
wget https://storage.googleapis.com/golang/go1.8.1.linux-armv6l.tar.gz
sudo tar -xvf go1.8.1.linux-armv6l.tar.gz -C /usr/local
rm go1.8.1.linux-armv6l.tar.gz
sudo mkdir /opt/go
sudo chown -R pi:pi /opt/go
cat << '!' >> ~/.bashrc
export GOROOT=/usr/local/go
export GOPATH=/opt/go
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
!
source ~/.bashrc
```
linux64
```bash
wget https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
sudo tar -xvf go1.8.3.linux-amd64.tar.gz -C /usr/local
rm go1.8.3.linux-amd64.tar.gz
sudo mkdir /opt/go
sudo chown -R <user>:<user> /opt/go
cat << '!' >> ~/.bashrc
export GOROOT=/usr/local/go
export GOPATH=/opt/go
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
!
source ~/.bashrc
```

### Python
```bash
sudo apt-get install python-pip python-dev
sudo pip install --upgrade pip
```

### Python3
```bash
sudo apt-get -y install python3-pip
sudo pip3 install --upgrade pip3
```

## License

MIT License

Copyright (c) 2014-2018 Emmanuel CHARETTE

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
