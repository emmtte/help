Raspberry-Service
=================

### Prerequisites
````
sudo apt-get install googlecl imagemagick mencoder
````


#### Midnight commander
````
sudo apt-get remove mc
sudo apt-get install libglib2.0-dev libslang2-dev
wget http://ftp.midnight-commander.org/mc-4.8.12.tar.bz2
bzip2 -cd mc-4.8.12.tar.bz2 | tar xvf -
cd mc-4.8.12
./configure
make
sudo make install

sudo make uninstall

curl -o ~/.config/mc/menu https://raw.githubusercontent.com/ManuCart/ServicePi/master/menu
cp /etc/mc/mc.keymap ~/.config/mc/

cat << EOF | sudo tee -a ~/.config/mc/ini

[Colors]
base_color=default,default
menu=black,cyan
menuhot=brightmagenta,cyan
menusel=white,blue
menuhotsel=brightmagenta,blue

EOF

````
Go to https://www.pushbullet.com/account
and copy TOKEN

````
curl -o pushbullet https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/pushbullet
sudo chmod a+x pushbullet
echo "API_KEY=ABCDEFGHIJKLMNOPQRSTUVWXYZ" > ~/.config/pushbullet
````

````
Menu bar -> Options -> Panel Options -> Main Panel Options
[x] Show hidden files
````
#### Youtube-dl

````
sudo curl https://yt-dl.org/latest/youtube-dl -o /usr/bin/youtube-dl
sudo chmod a+x /usr/bin/youtube-dl
echo "login user@gmail.com" > .netrc
echo "password XXXXXXXX" >> .netrc
````

flickr utf8
convmv -f cp1252 -t utf-8 -r --notest /media/hdd/photos
