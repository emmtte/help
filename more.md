Raspberry Pi Workshop
=====================

  + [Adafruit](#adafruit)
  + [Ascii colors](#ascii-colors)
  + [Format drive](#format-drive)
  + [Ifttt](#ifttt)
  + [Keeweb](#keeweb)
  + [Mosquitto](#mosquitto)
  + [Ncurses](#ncurses)
  + [Pushbullet](#pushbullet)
  + [Telegram](#telegram)
<br>


Adafruit
--------
https://io.adafruit.com/rpi_home/feeds
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
<br>

Format usb drive
----------------
http://askubuntu.com/questions/22381/how-to-format-a-usb-flash-drive
```bash
lsblk
sudo fdisk /dev/sdb
```
+ delete
+ new
+ primary
+ 1
+ write
  - d ENTER
  - o ENTER
  - n ENTER,
  - p ENTER
  - 1 ENTER
  - w ENTER
```bash
sudo mkfs.ntfs /dev/sdb1
sudo eject /dev/sdb
```

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
<br>

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
<br>

Mosquitto
---------
https://mosquitto.org/
```bash
sudo apt-get install mosquitto mosquitto-clients
mosquitto_sub -h mqtt.devicehub.net -p 1883 -t "`cat ~/.mqtt`" -R | jq '.["value"]' -r
cat test.json | jq '.["value"]' -r
sudo apt-get -y install python3
pip3 install --upgrade --pre acdcli
mosquitto_pub -h mqtt.dioty.co -p 8883 -u <your user-id> -P <your password> -t <topic> -m <message>
mosquitto_sub -h mqtt.dioty.co -p 8883 -u "user@mail.com" -P "abcdefg" -t "user@mail.com/#" -v
```
<br>

Ncurses
-------
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
<br>

Octoprint
---------
Installation<br>
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
http://192.168.0.1:5000/<br>

Cura Engine<br>
http://octoprint.org/files/octopi/cura_engine_14.12/
```
sudo wget -O /usr/local/bin/cura_engine http://octoprint.org/files/octopi/cura_engine_14.12/cura_engine
sudo chmod +x /usr/local/bin/cura_engine
```

Config Files<br>
http://ingegno.be/de-vertex-printer-en-cura/
<br>

Pushbullet-cli
--------------
https://github.com/r-darwish/pushbullet-cli
```bash
git clone https://github.com/r-darwish/pushbullet-cli.git
cd pushbullet-cli
sudo python setup.py install
cd ..
sudo rm -rf pushbullet-cli
pb set-key
```
<br>

Pushbullet-bash
---------------
https://github.com/Red5d/pushbullet-bash
```bash
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/pushbullet -o /usr/local/bin/pushbullet
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/JSON.sh -o /usr/local/bin/JSON.sh
sudo chmod +x /usr/local/bin/pushbullet /usr/local/bin/JSON.sh
```
https://www.pushbullet.com/account
```shell
echo "PB_API_KEY=ABCDEFGHIJKLMNOPQRSTUVWXYZ" > ~/.config/pushbullet
```
<br>

Rust
----
http://f4b1.com/raspberry-pi/comment-installer-rust-sur-un-raspberry-pi-3
http://doc.crates.io/guide.html

<br>

Sharp
-----
```bash
sudo npm install --unsafe-perm sharp -g sharp-cli
identify -format "%wx%h"
if [ `identify -format "%w" "$toto"` -le 2048 ]; then echo "VRAI" ; fi
```
<br>

Time
----
```bash
sudo /etc/init.d/ntp stop
sudo ntpd -q -g
sudo /etc/init.d/ntp start
```
<br>

Tmux
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
<br>




Videos
------
```bash
mpv video.mp4 -of webm -ovc libvpx -ovcopts qmin=6,b=1000000k -oac libvorbis -oacopts qscale=3 -o out.webm
mpv video.mp4 -of webm -ovc libvpx -ovcopts qmin=0,qmax=25,b=1000000k -oac libvorbis -oacopts qscale=3 -o out.webm
mkvmerge -o out.mkv 1.mp4 + 2.mp4
```
<br>

