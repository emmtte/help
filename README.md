Raspberry-Service
=================

Raspberry Service Tools

####Installation

    wget -O rs https://raw.github.com/ManuCart/Raspberry-Service/master/rs.sh
    chmod +x rs
    sudo echo "export PATH=$PATH:/$HOME" > ~/.profile
    source ~/.profile
    rs

####New Version with pdmenu
```
    sudo apt-get install curl pdmenu
    curl -o pdm https://raw.githubusercontent.com/ManuCart/ServicePi/master/pdmenu
    curl -o showdir.pl https://raw.githubusercontent.com/ManuCart/ServicePi/master/showdir.pl
    curl -o editdir.pl https://raw.githubusercontent.com/ManuCart/ServicePi/master/editdir.pl
    chmod +x pdm
    pdm
```
