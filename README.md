Raspberry-Service
=================

Installation
============
## Prepare Sd Card
Dowload and Install [Win32diskImager](http://sourceforge.net/projects/win32diskimager/files/Archive/win32diskimager-v0.9-binary.zip/download)
Download last [Raspbian](http://downloads.raspberrypi.org/raspbian_latest) realease

## Raspi Config
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

## Update Raspbian & Firmware
````
sudo apt-get autoremove
sudo apt-get update
sudo apt-get -y upgrade
sudo rpi-update
````
    
##ssh
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
## Prerequisites
````
sudo apt-get install tmux exif mencoder
mkdir /home/pi/service/
cd /home/pi/service/
touch 3rd_party backup system tmux update
````
## Midnight commander
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
## Menu
````
curl -o ~/.config/mc/menu https://raw.githubusercontent.com/ManuCart/ServicePi/master/menu
alias mc='mc /home/pi/service'
echo "alias mc='mc /home/pi/service'" >> ~/.profile
source ~/.profile
````
Tools
=====
##Remove X Server
````
sudo apt-get remove --auto-remove --purge libx11-.*
````
##fail2ban
````
sudo apt-get install fail2ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo service fail2ban restart
````
## dash to bash and vice cersa
````
sudo ln -sf bash /bin/sh
sudo ln -sf dash /bin/sh
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
