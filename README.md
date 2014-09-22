Raspberry-Service
=================

### Prerequisites
````
sudo apt-get install exif googlecl imagemagick mencoder
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
````
#### Menu
````
curl -o ~/.config/mc/menu https://raw.githubusercontent.com/ManuCart/ServicePi/master/menu
````
#### Drive
````
wget http://xivilization.net/~marek/raspbian/xivilization-raspbian.gpg.key -O - | sudo apt-key add -
sudo wget http://xivilization.net/~marek/raspbian/xivilization-raspbian.list -O /etc/apt/sources.list.d/xivilization-raspbian.list
sudo apt-get update
sudo apt-get install golang

sudo go get github.com/rakyll/drive
drive help
/usr/lib/go/bin/drive init /media/hdd/drive

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
