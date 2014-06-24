Raspberry-Service
=================

Raspberry Service Tools

####Installation

    wget -O rs https://raw.github.com/ManuCart/Raspberry-Service/master/rs.sh
    chmod +x rs
    sudo echo "export PATH=$PATH:/$HOME" > ~/.profile
    source ~/.profile
    rs
### Prerequisites
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
pdm
```
