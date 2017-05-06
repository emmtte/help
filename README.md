Raspberry Pi Workshop
=====================

  + [adafruit](#adafruit)
  + [Ifttt](#ifttt)
  + [Keeweb](#keeweb)
  + [Mosquitto](#mosquitto)
  + [Pushbullet](#pushbullet)
  + [Telegram](#telegram)
<br><br>

adafruit
--------
```bash
connection adafruit-light-sensor
address io.adafruit.com:1883
#bridge_atetempt_unsubscribe false
#cleansession false
notifications true
remote_username username
remote_password CHANGE_TO_YOUR_AIO_KEY
start_type automatic
#topic /sensors/lightsensor  out 0 lightsensor
```
<br><br>

ascii colors
------------
http://misc.flogisoft.com/bash/tip_colors_and_formatting
<br><br>

format
------
http://askubuntu.com/questions/22381/how-to-format-a-usb-flash-drive
```bash
lsblk
sudo fdisk /dev/sdb
```
use keyboard to delete, new, primary, 1, write ==>> d ENTER,o ENTER,n ENTER, p ENTER, 1 ENTER, w ENTER
```bash
sudo mkfs.ntfs /dev/sdb1
sudo eject /dev/sdb
```
<br><br>

git
---
```bash
mkdir mcui
cd mcui
git init
touch README.md
git add README.md
git config --global user.email "email@email.com"
git config --global user.name "Manucart"
git commit -m ""
git remote add origin git@github.com:ManuCart/mcui.git
git push origin master

mkdir whypi
cd whypi
echo "# Whiptail" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:ManuCart/mcui.git

git config --global push.default simple
git add README.md
git commit -m "first commit"
git push

git pull

sudo apt-get install git
ssh-keygen -t rsa -b 4096 -C "email@gmail.com"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
```
<br><br>

ncurses-rs
----------
https://github.com/jeaye/ncurses-rs
```bash
ncurses

sudo apt-get install libncurses5-dev libncursesw5-dev

export RUSTUP_USE_HYPER=1
curl https://sh.rustup.rs -sSf | sh

git clone https://github.com/jeaye/ncurses-rs.git
cd ncurses-rs

source $HOME/.cargo/env
cargo build

git clone https://github.com/gyscos/Cursive.git
cargo build
cargo run --bin      ?????????????
```
<br><br>

Mouse control
-------------
http://www.it1352.com/322101.html
```bash
echo -e "\e[?1000h" #start tracking mouse
echo -e "\e[?1005h"
echo -e "\e[?1000l" #stop tracking mouse
showkey -a
/usr/bin/mc -x #use mouse under tmux
/usr/bin/mc -u #without subshell
```
<br><br>

time
----
```bash
sudo /etc/init.d/ntp stop
sudo ntpd -q -g
sudo /etc/init.d/ntp start
```
<br><br>

octoprint
=========
Installation
------------
https://github.com/foosel/OctoPrint/wiki/Setup-on-a-Raspberry-Pi-running-Raspbian
```
cd ~
sudo apt-get install python-pip python-dev python-setuptools python-virtualenv git libyaml-dev build-essential
git clone https://github.com/foosel/OctoPrint.git
cd OctoPrint
virtualenv venv
./venv/bin/pip install pip --upgrade
./venv/bin/python setup.py install
mkdir ~/.octoprint
~/OctoPrint/venv/bin/octoprint
```
http://192.168.0.1:5000/

Cura Engine
-----------
http://octoprint.org/files/octopi/cura_engine_14.12/
```
sudo wget -O /usr/local/bin/cura_engine http://octoprint.org/files/octopi/cura_engine_14.12/cura_engine
sudo chmod +x /usr/local/bin/cura_engine
```

Config Files
------------
http://ingegno.be/de-vertex-printer-en-cura/
<br><br>

pushbullet
----------
```bash
git clone https://github.com/r-darwish/pushbullet-cli.git
cd pushbullet-cli
sudo python setup.py install
cd ..
sudo rm -rf pushbullet-cli
pb set-key
```
<br><br>

mosquitto
---------
```bash
sudo apt-get install mosquitto mosquitto-clients

mosquitto_sub -h mqtt.devicehub.net -p 1883 -t "`cat ~/.mqtt`" -R | jq '.["value"]' -r
cat test.json | jq '.["value"]' -r

sudo apt-get -y install python3
pip3 install --upgrade --pre acdcli

mosquitto_pub -h mqtt.dioty.co -p 8883 -u <your user-id> -P <your password> -t <topic> -m <message>
mosquitto_sub -h mqtt.dioty.co -p 8883 -u "user@mail.com" -P "abcdefg" -t "user@mail.com/#" -v
```
<br><br>

sharp
-----
```bash
sudo npm install --unsafe-perm sharp -g sharp-cli

identify -format "%wx%h"
if [ `identify -format "%w" "$toto"` -le 2048 ]; then echo "VRAI" ; fi
```
<br><br>

rust
----
http://f4b1.com/raspberry-pi/comment-installer-rust-sur-un-raspberry-pi-3
http://doc.crates.io/guide.html

tmux
----
```bash
tmux send-keys -t A Escape Escape

tmux new-window -t pi -a
tmux kill-window -t Z

tmux display-message 'END'
set -g display-time 1000

tmux last-window

tmux list-windows | grep "bash*" | cut -d ':' -f  1

tmux select-window -t 12
tmux send-keys -t 12 "test"

tmux display-message -p '#I'
tmux display-message -p '#{window_index}'

tmux set pane-border-format "Midnight Commander"

tmux set-option display-time 10000
tmux display-message -t "fin du truc"

tmux rename-window "Title Text"


tmux switch-client -t bg

tmux kill-session -t bg
tmux kill-session
```
<br><br>

stream2chromecast
-----------------
https://github.com/Pat-Carter/stream2chromecast
```bash
sudo apt-get install libav-tools
cd ~/.bin
git clone https://github.com/Pat-Carter/stream2chromecast.git
cd stream2chromecast
stream2chromecast.py -playurl http://hi5.streamingsoundtracks.com
```
<br><br>

videos
------
```bash
mpv video.mp4 -of webm -ovc libvpx -ovcopts qmin=6,b=1000000k -oac libvorbis -oacopts qscale=3 -o out.webm
mpv video.mp4 -of webm -ovc libvpx -ovcopts qmin=0,qmax=25,b=1000000k -oac libvorbis -oacopts qscale=3 -o out.webm
mkvmerge -o out.mkv 1.mp4 + 2.mp4
```
<br><br>

tmux
----
```bash
tab 
s  list sessions
$  name session
c  create window
w  list windows
n  next window
p  previous window
f  find window
,  name window
&  kill window
d  detach
t  big clock
?  list shortcuts
:  prompt
```
<br><br>

transission
-----------
```bash
transmission-remote -l
whiptail --title "Transmission" --msgbox "`transmission-remote -l`" 30 136
transmission-remote -t ID --remove-and-delete
transmission-remote -t ID --stop
transmission-remote -t 3 --start
transmission-remote -a $FILE
```
<br><br>

whiptail
--------
colors
```bash
root                  root fg, bg #image de fond
border                border fg, bg # bordure
window                window fg, bg # couleur interieur fenetre
shadow                shadow fg, bg # coleur ombre
title                 title fg, bg # couleur titre
button                button fg, bg # button avec le focus
compactbutton         compact button fg, bg # button sans le focus
actbutton             active button fg, bg
checkbox              checkbox fg, bg
actcheckbox           active checkbox fg, bg
entry                 entry box fg, bg
label                 label fg, bg
listbox               listbox fg, bg
actlistbox            active listbox fg, bg
textbox               textbox fg, bg
acttextbox            active textbox fg, bg
helpline              help line
roottext              root text
emptyscale            scale full
fullscale             scale empty
disentry              disabled entry fg, bg
actsellistbox         active & sel listbox
sellistbox            selected listbox
color0  or black
color1  or red
color2  or green
color3  or brown
color4  or blue
color5  or magenta
color6  or cyan
color7  or lightgray
color8  or gray
color9  or brightred
color10 or brightgreen
color11 or yellow
color12 or brightblue
color13 or brightmagenta
color14 or brightcyan
color15 or white
```
<br><br>

Ifttt
-----
https://ifttt.com/adafruit
```bash
echo "{key}" > ~/.AIO_KEY
mosquitto_pub -h io.adafruit.com -p 8883 -u rpi_home -P `cat ~/.AIO_KEY` -t rpi_home -m test
mosquitto_pub -h io.adafruit.com -p 1883 -u rpi_home -P `cat ~/.AIO_KEY` -t rpi_home/f/rpi -m "test"
mosquitto_sub -h io.adafruit.com -p 1883 -u rpi_home -P `cat ~/.AIO_KEY` -t rpi_home/# -R | jq '.'
mosquitto_sub -h io.adafruit.com -p 1883 -u rpi_home -P `cat ~/.AIO_KEY` -t rpi_home/# -R | jq --raw-output '.value'
mosquitto_sub -h io.adafruit.com -p 1883 -u rpi_home -P `cat ~/.AIO_KEY` -t rpi_home/# -R | jq --raw-output 'select(.value != null).value'
```
<br><br>

Keeweb
------
https://github.com/keeweb/keeweb
https://github.com/ManuCart/RaspberryPi/blob/master/scripts/install-keeweb
<br><br>

Mosquitto
---------
https://mosquitto.org/
```bash
curl -O http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
sudo apt-key add mosquitto-repo.gpg.key
rm mosquitto-repo.gpg.key
cd /etc/apt/sources.list.d/
sudo wget http://repo.mosquitto.org/debian/mosquitto-jessie.list
sudo apt-get update
```
<br><br>

Pushbullet-cli
--------------
https://github.com/r-darwish/pushbullet-cli
```bash
https://github.com/r-darwish/pushbullet-cli
git clone https://github.com/r-darwish/pushbullet-cli.git
cd pushbullet-cli
sudo python setup.py install
cd ..
sudo rm -rf pushbullet-cli
pb set-key
```
<br><br>

Pushbullet
----------
https://github.com/Red5d/pushbullet-bash
```bash
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/pushbullet -o /usr/local/bin/pushbullet
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/JSON.sh -o /usr/local/bin/JSON.sh
sudo chmod +x /usr/local/bin/pushbullet /usr/local/bin/JSON.sh
```
:bangbang: https://www.pushbullet.com/account
```shell
echo "PB_API_KEY=ABCDEFGHIJKLMNOPQRSTUVWXYZ" > ~/.config/pushbullet
```
<br><br>


Telegram
--------
https://github.com/vysheng/tg
```bash
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev libjansson-dev libpython-dev make 
git clone --recursive https://github.com/vysheng/tg.git
cd tg
./configure
make

If error
mcedit tgl/mtproto-utils.c
comment lines 101, 108, 116 and 122 with assert (0) 
make

sudo cp ~/tg/bin/telegram-cli /usr/bin  
sudo mkdir -p /etc/telegram-cli  
sudo mv ~/tg/tg-server.pub /etc/telegram-cli/server.pub 

~/tg/bin/telegram-cli -b bot -s ~/scripts/tg.lua
```
<br><br>
