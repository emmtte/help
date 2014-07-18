Raspberry-Service
=================

### Prerequisites
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

curl -o ~/.config/mc/menu https://raw.githubusercontent.com/ManuCart/ServicePi/master/mc.menu
cp /etc/mc/mc.keymap ~/.config/mc/

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

#### Pdmenu
```
sudo apt-get install curl pdmenu
curl -o pdm https://raw.githubusercontent.com/ManuCart/ServicePi/master/pdmenu
chmod +x pdm
sudo echo "export PATH=$PATH:/$HOME" > ~/.profile
source ~/.profile
pdm
```
