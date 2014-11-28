Raspberry-Service
=================

### Prerequisites
````
sudo apt-get install tmux exif mencoder
mkdir /home/pi/service/
touch /home/pi/service/3rd_party
touch /home/pi/service/backup
touch /home/pi/service/system
touch /home/pi/service/tmux
touch /home/pi/service/update

````
#### Midnight commander
````
sudo apt-get remove mc
sudo apt-get install libglib2.0-dev libslang2-dev
wget http://ftp.midnight-commander.org/mc-4.8.13.tar.bz2
bzip2 -cd mc-4.8.13.tar.bz2 | tar xvf -
cd mc-4.8.13
./configure
make
sudo make install
update-alternatives --set editor /usr/local/bin/mcedit
export EDITOR=/usr/local/bin/mcedit
````
#### Menu
````
curl -o ~/.config/mc/menu https://raw.githubusercontent.com/ManuCart/ServicePi/master/menu
alias mc='mc /home/pi/service'
echo "alias mc='mc /home/pi/service'" >> ~/.profile
source ~/.profile
````

#### rclone
````
curl -o rclone.zip http://downloads.rclone.org/rclone-v1.05-linux-arm.zip
unzip rclone.zip
sudo cp rclone-v1.05-linux-arm/rclone /usr/bin/rclone
rclone config
rclone sync gdrive:/Photos_Old pi:/media/hdd/rclone
````
#### Pushbullet
https://www.pushbullet.com/account
````
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/pushbullet -o /usr/bin/pushbullet
sudo chmod a+x /usr/bin/pushbullet
echo "API_KEY=ABCDEFGHIJKLMNOPQRSTUVWXYZ" > ~/.config/pushbullet
````

#### Youtube-dl
````
sudo curl https://yt-dl.org/latest/youtube-dl -o /usr/bin/youtube-dl
sudo chmod a+x /usr/bin/youtube-dl
````
