# Headless Raspberry Pi Setup

**Setup**

 - [Dropbox-Uploader](#dropbox-uploader)
 - [Git](#git)
 - [Go Language](#go-language)
 - [Google Drive](#google-drive)
 - [Google Music](#google-music-scripts)
 - [Grafana](#grafana)
 - [Http Server](#http-server)
 - [InfluxDB](#influxdb)
 - [Midnight Commander](#midnight-commander)
 - [Neovim](#neovim)
 - [Node JS](#node-js)
 - [Pi Hole](#pi-hole)
 - [PuTTY](#putty)
 - [Samba](#samba)
 - [Telegram](#telegram)
 - [Tmux](#tmux)
 - [Youtube Download](#youtube-download)
 - [Youtube Upload](#youtube-upload)

**Configuration**

 - [Operating System](#operating-system)
 - [Username and Password](#username-and-password)
 - [Key-based authentication](#key-based-authentication)
 - [Domain Name System](#domain-name-system)
 - [Disable Bluetooth and Wifi](#disable-bluetooth-and-wifi)
 - [Remove Swap File](#remove-swap-file)
 - [Format USB Key](#format-usb-key)

##### Prerequisites

````sudo apt-get install gpac libav-tools mkvtoolnix mpv exiv2 rsync ntfs-3g ghostscript````

## Dropbox Uploader
 - https://github.com/andreafabrizi/Dropbox-Uploader
````
sudo curl -o /usr/local/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/local/bin/dropbox_uploader
dropbox_uploader init
````

## Git
 - https://github.com/git/git

````sudo apt-get install git````

````
git clone git@github.com:emmtte/Raspberry-Pi-User-Menu.git ~/rpi
cd rpi
ssh-keygen -t rsa -b 4096 -C "Raspberry Pi" -f $HOME/.ssh/github
# Copy contents github.pub to github.com
eval $(ssh-agent -s)
ssh-add ~/.ssh/github
ssh -vT git@github.com
git remote set-url origin git@github.com:emmtte/Raspberry-Pi-User-Menu.git
git config --global user.name "emmtte"
git config --global user.email "John.Smith@example.com"
echo -e "Host github.com \n IdentityFile ~/.ssh/github" &gt;&gt; ~/.ssh/config
````

## Go Language
 - https://github.com/golang/go
````
VERSION=1.14.2.linux-armv6l
curl -L -o go$VERSION.tar.gz https://storage.googleapis.com/golang/go$VERSION.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.tar.gz
cat &lt;&lt; ! &gt;&gt; ~/.bashrc
export GOPATH=\$HOME/go
export PATH=\$GOPATH:\$GOPATH/bin:\$PATH
!
source ~/.bashrc
````


## Google Drive

 - https://github.com/odeke-em/drive

`sudo apt-get install git`

````
go get -u github.com/odeke-em/drive/cmd/drive
mkdir /media/hdd/drive
drive init /media/hdd/drive
````



## Google Music
 - https://github.com/thebigmunch/google-music-scripts

````
sudo apt-get install libav-tools #avconv
sudo pip3.7 install -U google-music-scripts
````


## Grafana
 - https://github.com/grafana/grafana

````
sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/oss/release/grafana_7.0.1_armhf.deb
sudo dpkg -i grafana_7.0.1_armhf.deb
rm grafana_7.0.1_armhf.deb
sudo nvim /etc/grafana/grafana.ini
````

````
[server]
  # Protocol (http, https, socket)
  protocol = http
  # The http port  to use
  http_port = 3000
````

````
sudo service grafana-server restart
````

http://localhost:3000/login  (_default admin/admin_)

## Http Server
 - https://github.com/http-party/http-server

##### Installation

````npm install --global http-server````

````http-server /media/key/igb````


## InfluxDB
 - https://github.com/influxdata/influxdb

```
VERSION=1.8.0
wget https://dl.influxdata.com/influxdb/releases/influxdb_$VERSION_armhf.deb
sudo dpkg -i influxdb_$VERSION_armhf.deb
rm influxdb_$VERSION_armhf.deb
sudo nvim /etc/influxdb/influxdb.conf
```

```
[http]
  # Determines whether HTTP endpoint is enabled.
  enabled = true
  # The bind address used by the HTTP service.
  bind-address = ":8086"
  # Determines whether user authentication is enabled over HTTP/HTTPS.
  auth-enabled = false
[meta]
  dir = "/media/key/influxdb"
[data]
  dir = "/media/key/influxdb/data"
  wal-dir = "/media/key/influxdb/wal"
```

```
sudo service influxdb restart
influx
> CREATE DATABASE binance
> #DROP DATABASE binance
```


## Midnight Commander
 - https://github.com/MidnightCommander/mc

```sudo apt-get install mc```

```
sudo apt-gen install autogen autoconf libtool gettext libslang2-dev
wget https://github.com/MidnightCommander/mc/archive/4.8.20.tar.gz
tar xvfz 4.8.20.tar.gz
cd mc-4.8.20
autoconf
./configure
make
make install
```

**Optional**
```
wget -O ~/.local/share/mc/skins/ \
https://raw.githubusercontent.com/emmtte/Headless-Raspberry-Pi-Setup/master/.local/share/mc/skins/palenight.ini
nvim ~/.config/mc/ini
```

```
[Midnight Commander]
skin=palenight
```

**Select Editor**
````
echo "SELECTED_EDITOR='/usr/local/bin/nvim'" | tee -a ~/.selected_editor
````


## Neovim
 - https://github.com/neovim/neovim

````shell
sudo apt-get install -y git libtool libtool-bin autoconf automake cmake g++ pkg-config unzip libffi-dev
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
````

#### Exuberant Ctags

https://github.com/romainl/ctags-patterns-for-javascript

````
sudo apt-get install exuberant-ctags
wget https://raw.githubusercontent.com/romainl/ctags-patterns-for-javascript/master/ctagsrc -O /home/pi/~/.ctags
ctags -R
````

#### Plugins

 - https://github.com/junegunn/vim-plug
 >````
 >if empty(glob('~/.config/nvim/autoload/plug.vim'))
 >silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
 >\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 >autocmd VimEnter * PlugInstall
 >endif
 >call plug#begin()
 >````
 - https://github.com/neoclide/coc.nvim
 >````
 >Plug 'neoclide/coc.nvim', {'branch': 'release'}
 >````
 - https://github.com/drewtempelmeyer/palenight.vim
>````
>Plug 'drewtempelmeyer/palenight.vim'
>set background=dark
>colorscheme palenight
>````
 - https://github.com/vim-airline/vim-airline
 >````
 >Plugin 'vim-airline/vim-airline'
 >Plugin 'vim-airline/vim-airline-themes'
 >````
 - https://github.com/edkolev/tmuxline.vim
 - https://github.com/majutsushi/tagbar
 >````
 >Plug 'majutsushi/tagbar'
 >call plug#end()
 >````

````
nvim ~/.config/nvim/init.vim
if empty(glob('~/.config/nvim/autoload/plug.vim'))
silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall
endif
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'majutsushi/tagbar'
call plug#end()
````

**Commands**
>````
>:Tmuxline
>:Tagbar
>:PlugInstall
>:PlugUpdate
>:PlugClean
>:CheckHealth
>:Prettier
>:Eslint
>:run ctags script.mjs
>````

#### neovim-remote
 - https://github.com/mhinz/neovim-remote
````
pip3 install neovim-remote
NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim
````


## Node JS
 - https://github.com/nodejs/node

````
VERSION=14.0.0
sudo apt-get -y install build-essential
wget https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-armv7l.tar.gz -O node.tar.gz
sudo tar -xvf node.tar.gz --strip 1 -C /usr/local
rm node.tar.gz
````

````
mkdir ~/bot 
cd ~/bot
wget https://raw.githubusercontent.com/emmtte/Headless-Raspberry-Pi-Setup/master/package.json
wget https://raw.githubusercontent.com/emmtte/Headless-Raspberry-Pi-Setup/master/.prettierrc
npm install
````

**Packages**

 - binance-api-node : https://github.com/Ashlar/binance-api-node
 - bignumber.js : https://github.com/MikeMcl/bignumber.js
 - coinmarketcap-api : https://github.com/tiaanduplessis/coinmarketcap-api
 - nanoid : https://github.com/ai/nanoid
 - node-schedule : https://github.com/node-schedule/node-schedule
 - telegraf : https://github.com/telegraf/telegraf
 - tulind : https://github.com/TulipCharts/tulipnode

**Dev Packages**
 - https://github.com/eslint/eslint
 - https://github.com/prettier/prettier

````npm install --save-dev eslint prettier eslint-config-prettier eslint-plugin-prettier````

**Docs Packages**

 - https://github.com/jsdoc/jsdoc
 - https://github.com/SoftwareBrothers/better-docs
````
npm install -g jsdoc
npm install --save-dev better-docs
jsdoc your-documented-file.js -t ./node_modules/better-docs
````

**Uninstall**

````
sudo rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}
````


## PuTTY
 - https://www.chiark.greenend.org.uk/~sgtatham/putty/
 - https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
 - https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/putty/Subliminal.reg

````
Terminal Keyboard
        The Function keys and keypad
	        ( ) ESC[n~  ( ) Linux    (O) Xterm R6 
		( ) VT400   ( ) VT100+   ( ) SCO
Window > Apprearance
	Font: MesloLGS NF, 11-point
        [X] Allow selection of variable-pith fonts
	Font quality:
		( ) Antialiased     ( ) Non-Antialiased
		(O) ClearType       ( ) Default
Window > Translation
        Remote character set = UTF-8
Window > Colours
	[X] Allow terminal to specify ANSI colours
	[X] Allow terminal to use xterm 256-colour mode
	Indicate bolded text by changing:
		( ) The font   (O) The colour   ( ) Both
	[ ] Attempt to use logical palettes
	[ ] Use system colours
Connection > Data
	Terminal-type string = xterm-256color
````
Download and install the DejaVu font in Windows.
Run PuTTY and create a new session with the following settings
Window-Appearance-Font = DejaVu Sans Mono for Powerline
Verify your linux locale LANG=en_US.UTF-8
Verify that your .vimrc has "set encoding=utf-8"
Verify your term session is capable of 256 colors (TERM=xterm-256color)

## Pi Hole

 - https://github.com/pi-hole/pi-hole

``curl -sSL https://install.pi-hole.net | bash``

## Samba

 - https://github.com/samba-team/samba

````
sudo apt-get -y install samba samba-common-bin
cat &lt;&lt;<< EOF | sudo tee -a /etc/samba/smb.conf
[HDD]
comment = Raspberry Pi Hard Drive
path = /media/hdd
read only = no
browsable = yes
EOF
sudo service smbd restart
sudo smbpasswd -a pi
````


## Telegram
 - https://telegram.me/botfather

 1. Use the **/newbot** command to create a new bot. The BotFather will ask you for a name and username, then generate an authorization token for your new bot.
 2. The **name** of your bot is displayed in contact details and elsewhere.
 3. The **Username** is a short name, to be used in mentions and telegram.me links. Usernames are 5-32 characters long and are case insensitive, but may only include Latin characters, numbers, and underscores. Your bot's username must end in ‘bot’.
 4. Copy the **TOKEN** to the configuration file .env or config.json
 5. Send a dummy message to your new bot
 6. Go to following url https://api.telegram.org/botTOKEN/getUpdates
 7. Look for ``"chat":{"id":``
 8. Copy the **chatid** to the configuration file .env or config.json
````
sudo apt-get install -y jq
curl https://api.telegram.org/bot$TELEGRAM_TOKEN/getUpdates | jq .result[0].message.chat.id
````

## Tmux

 - https://github.com/tmux/tmux

```sudo apt-get install tmux```

````shell
tmux -V
tmux kill-server
sudo apt-get install -y libevent-dev libncurses5-dev
wget https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz
tar xvfz tmux-2.8.tar.gz
cd tmux-2.8
./configure &amp;&amp;& make
sudo cp ./tmux /usr/bin/tmux
tmux -V
cd ..
rm tmux-2.8.tar.gz
rm -rf tmux-2.8
````

## Youtube Download
 - https://github.com/rg3/youtube-dl

````
sudo apt-get -y install libavcodec-extra libav-tools
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
echo "PLAYLIST_LINK" >> ~/.youtube-dl
mkdir /medi/hdd/youtube-dl
youtube-dl --output "/media/hdd/youtube-dl/%(title)s.%(ext)s" https://www.youtube.com/playlist?list=`cat ~/.youtube-dl`
````


## Youtube Upload
 - https://github.com/tokland/youtube-upload
 - https://github.com/tokland/youtube-upload/pull/264


````shell
sudo pip install --upgrade google-api-python-client oauth2client progressbar2
wget https://github.com/tokland/youtube-upload/archive/master.zip
unzip master.zip
cd youtube-upload-master
sudo python setup.py install
dropbox_uploader download /opt/key/youtube-upload-client-secret.json
mv youtube-upload-client-secret.json .client_secrets.json
dropbox_uploader download /opt/key/samplevideo.mp4
youtube-upload --title="test" --privacy="private" samplevideo.mp4
cd ..
rm samplevideo.mp4 master.zip
sudo rm -rf youtube-upload-master
````


## Configuration
#### Operating System
##### Configuration
````shell
#Use lsblk to check /dev/sdc
rm /media/hdd/raspbian.zip
curl --progress-bar -L -o /media/hdd/raspbian.zip https://downloads.raspberrypi.org/raspbian_lite_latest
#curl --progress-bar -L -o /media/hdd/raspbian.zip https://downloads.raspberrypi.org/raspbian_full_latest
#curl --progress-bar -L -o /media/hdd/raspbian.zip https://downloads.raspberrypi.org/raspbian_latest
#unzip -p raspbian.zip | sudo dd of=/dev/sda bs=4M status=progress conv=fsync
unzip -p /media/hdd/raspbian.zip | sudo dd of=/dev/sda bs=4M conv=fsync
sudo mkdir /media/cardreader
sudo mount /dev/sda1 /media/cardreader
sudo touch /media/cardreader/ssh
sudo umount /media/cardreader
````

####  Raspberry Pi Configuration

##### Installation

```sudo raspi-config```

##### Configuration

 - **4** Localisation Options **>** **I1** Change Locale **>** fr_FR.UTF-8 UTF-8
 - **4** Localisation Options **>** **I2** Change Timezone **>**  Europe and Time zone : Paris
 - **5** Interfacing Options **>** **P1** Camera > Disable
 - **7** Advanced Options **>** **A1** Expand Filesystem

#### Change Password


#### Key-based authentication
````
ssh-keygen
mv ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
sudo chmod 644 ~/.ssh/authorized_keys
sudo chown $USER:$USER ~/.ssh/authorized_keys
cat &lt;&lt; EOF | sudo tee -a /etc/ssh/sshd_config
#AuthorizedKeysFile /home/$USER/.ssh/authorized_keys
UsePAM yes
PermitRootLogin no
PasswordAuthentication no
ChallengeResponseAuthentication no
EOF
sudo service ssh restart
````

 - https://www.putty.org/

**puttygen.exe**


````
Conversions &gt;> Import Key &gt;> File &gt;> id_rsa
Save Private Key &gt;> Yes &gt;> File &gt;> id_rsa.ppk
````

#### Domain Name System
````
sudo apt-get install resolvconf
sudo dpkg-reconfigure resolvconf
````
*Prepare /etc/resolv.conf for dynamic updates?* **No**

````sudo nvim /etc/resolv.conf````

*nameserver 127.0.0.1*

````
sudo apt-get install dnsmasq dnsutils
sudo nvim /etc/dhcpcd.conf
interface eth0
  static ip_address=192.168.0.1/24
  static routers=192.168.0.254
  static domain_name_servers=127.0.0.1 8.8.8.8</i>
sudo /etc/init.d/networking restart
/etc/init.d/dnsmasq status
````
````
dig api.binance.com
dig @1.1.1.1 api.binance.com +short
````

#### Disable Bluetooth and Wifi

```shell
echo "dtoverlay=pi3-disable-wifi" | sudo tee -a /boot/config.txt
echo "dtoverlay=pi3-disable-bt" | sudo tee -a /boot/config.txt
sudo systemctl disable hciuart
sudo reboot
```

#### Remove Swap File

```
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove
sudo systemctl disable dphys-swapfile.service
```

#### Format USB key

````
lsblk
sudo fdisk /dev/sda
````

**Press keys** : *d, n, p, 1, ENTER, ENTER, t, 83, w*

````
sudo mkfs.ext4 /dev/sda1
sudo mkdir /media/key
sudo mount /dev/sda1 /media/key
sudo chown -R $USER:$USER /media/key
mkdir /media/key/influxdb
sudo chown -R influxdb:influxdb /media/key/influxdb
sudo blkid /dev/sda1
sudo mcedit /etc/fstab
PARTUUID=ABCDEFGH-01 /media/key ext4 defaults 0 0 
````


## MIT License

 - Copyright (c) Headless-Raspberry-Pi-Setup *March 9, 2013*
 - Copyright (c) Infinity-Grid-Trading-Bot         *May 1, 2018*

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

<!--stackedit_data:
eyJoaXN0b3J5IjpbODcxMTY2NDM1LC0xNTIwOTIxMDUzLC0xOD
EwNDM4Mjc5LDE0MzM3MDU1NjksMTY3OTA4Njc0NSwtMTM0MjEy
NzQwNiwtNDc3NDUzOTMxLC0yMDIzNjI4NzA2LDg2NTg5NTQwMS
wzNTcxNTMxMTgsLTEyMDczOTg3ODQsLTYyNDQ5NTgyNV19
-->