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
    ln -s showdir.pl editdir.pl
    ln -s showdir.pl deldir.pl
    ln -s showdir.pl adddir.pl
    ln -s showdir.pl addfile.pl
    chmod +x pdm showdir.pl
    pdm
```
