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
    
    sudo apt-get install pdmenu
    curl -o pdm https://raw.githubusercontent.com/ManuCart/ServicePi/master/pdmenu
    chmod +x pdm
    pdm

curl -O menu.zip https://raw.githubusercontent.com/ManuCart/ServicePi/master.zip
unzip menu.zip
rm menu.zip
