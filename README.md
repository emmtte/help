Raspberry-Service
=================

### Prerequisites
#### Midnight commander
````
sudo apt-get remove mc
wget http://ftp.midnight-commander.org/mc-4.8.12.tar.bz2
tar -xvzf mc-4.8.12.tar.bz2
cd mc-4.8.12.tar.bz2/
./configure
make
sudo make install
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
