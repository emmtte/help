# Headless Raspberry Pi Setup


<pre>
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/list-unordered.svg"> <b>Setup</b>
  • <a href="#dropbox-uploader">Dropbox-Uploader</a>
  • <a href="#git">Git</a>
  • <a href="#go-language">Go Language</a>
  • <a href="#google-drive">Google Drive</a>
  • <a href="#google-music-scripts">Google Music</a>
  • <a href="#grafana">Grafana</a>
  • <a href="#influxdb">InfluxDB</a>
  • <a href="#midnight-commander">Midnight Commander</a>
  • <a href="#neovim">Neovim</a>
  • <a href="#node-js">Node JS</a>
  • <a href="#pi-hole">Pi Hole</a>
  • <a href="#putty">PuTTY</a>
  • <a href="#samba">Samba</a>
  • <a href="#telegram">Telegram</a>
  • <a href="#tmux">Tmux</a>
  • <a href="#youtube-download">Youtube Download</a>
  • <a href="#youtube-upload">Youtube Upload</a>
<b>Configuration</b>
  • <a href="#operating-system">Operating System</a> 
  • <a href="#username-and-password">Username and Password</a> 
  • <a href="#key-based-authentication">Key-based authentication</a> 
  • <a href="#domain-name-system">Domain Name System</a>
  • <a href="#disable-bluetooth-and-wifi">Disable Bluetooth and Wifi</a>
  • <a href="#remove-swap-file">Remove Swap File</a>
  • <a href="#format-usb-key">Format USB Key</a>
</pre>


<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg">
info


![image](https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg)&nbsp;&nbsp;```sudo apt-get install gpac libav-tools mkvtoolnix mpv exiv2 rsync ntfs-3g ghostscript```


<div align="right"><a href="#license">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/info.svg"></a></div>



## Dropbox Uploader
<img align="left" width="18" height="18" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">&nbsp;https://github.com/andreafabrizi/Dropbox-Uploader
<pre>
<img  width="18" height="18" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
sudo curl -o /usr/local/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/local/bin/dropbox_uploader
dropbox_uploader init
</pre>

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="18" height="18" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>

## Git
<img width="18" height="18" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">&nbsp;https://github.com/git/git

<img width="18" height="18" src="https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg">&nbsp;```sudo apt-get install git```

<pre>
<img width="18" height="18" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
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
echo -e "Host github.com \n IdentityFile ~/.ssh/github" >> ~/.ssh/config
</pre>

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Go Language
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/golang/go

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```
VERSION=1.14.2.linux-armv6l
curl -L -o go$VERSION.tar.gz https://storage.googleapis.com/golang/go$VERSION.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.tar.gz
cat << ! >> ~/.bashrc
export GOPATH=\$HOME/go
export PATH=\$GOPATH:\$GOPATH/bin:\$PATH
!
source ~/.bashrc
```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Google Drive
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/odeke-em/drive

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg">

```sudo apt-get install git```

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/code.svg">

<pre class="shell">
go get -u github.com/odeke-em/drive/cmd/drive
mkdir /media/hdd/drive
drive init /media/hdd/drive
</pre>

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


## Google Music Scripts
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/thebigmunch/google-music-scripts

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
sudo apt-get install libav-tools #avconv
sudo pip3.7 install -U google-music-scripts
```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


## Grafana
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/grafana/grafana

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```
sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/oss/release/grafana_7.0.1_armhf.deb
sudo dpkg -i grafana_7.0.1_armhf.deb
rm grafana_7.0.1_armhf.deb
sudo nvim /etc/grafana/grafana.ini
```

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/file-code.svg">

````
[server]
  # Protocol (http, https, socket)
  protocol = http
  # The http port  to use
  http_port = 3000
````

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

````
sudo service grafana-server restart
````

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/link-external.svg">

http://localhost:3000/login (default admin/admin)

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


## InfluxDB
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/influxdata/influxdb

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```
VERSION=1.8.0
wget https://dl.influxdata.com/influxdb/releases/influxdb_$VERSION_armhf.deb
sudo dpkg -i influxdb_$VERSION_armhf.deb
rm influxdb_$VERSION_armhf.deb
sudo nvim /etc/influxdb/influxdb.conf
```

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/file-code.svg">

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
````

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

````
sudo service influxdb restart
influx
> CREATE DATABASE binance
> #DROP DATABASE binance
````

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Midnight Commander

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/MidnightCommander/mc

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg">

```sudo apt-get install mc```  

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

 <pre>
sudo apt-gen install autogen autoconf libtool gettext libslang2-dev
wget https://github.com/MidnightCommander/mc/archive/4.8.20.tar.gz
tar xvfz 4.8.20.tar.gz
cd mc-4.8.20
autoconf
./configure
make
make install

<b>Optional Skin</b>
wget -O ~/.local/share/mc/skins/ \
https://raw.githubusercontent.com/emmtte/Headless-Raspberry-Pi-Setup/master/.local/share/mc/skins/palenight.ini
nvim ~/.config/mc/ini

<i>[Midnight Commander]
skin=palenight</i>

<b>Selected Editor</b>
echo "SELECTED_EDITOR='/usr/local/bin/nvim'" | tee -a ~/.selected_editor
</pre>

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Neovim
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/neovim/neovim

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
sudo apt-get install -y git libtool libtool-bin autoconf automake cmake g++ pkg-config unzip libffi-dev
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/rocket.svg">

#### Universal Ctags

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/universal-ctags/ctags

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/file-code.svg">

<pre>
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install
ctags -R
</pre>

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/rocket.svg">

<pre>
<a href="https://github.com/junegunn/vim-plug">https://github.com/junegunn/vim-plug</a>
<a href="https://github.com/neoclide/coc.nvim">https://github.com/neoclide/coc.nvim</a>
<a href="https://github.com/drewtempelmeyer/palenight.vim">https://github.com/drewtempelmeyer/palenight.vim</a>
<a href="https://github.com/vim-airline/vim-airline">https://github.com/vim-airline/vim-airline</a>
<a href="https://github.com/edkolev/tmuxline.vim">https://github.com/edkolev/tmuxline.vim</a>
<a href="https://github.com/majutsushi/tagbar">https://github.com/majutsushi/tagbar</a>
</pre>

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/file-code.svg">

<pre>
nvim ~/.config/nvim/init.vim
<i>
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
</i>
</pre>

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Node JS
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/nodejs/node

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
VERSION=14.0.0
sudo apt-get -y install build-essential
wget https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-armv7l.tar.gz -O node.tar.gz
sudo tar -xvf node.tar.gz --strip 1 -C /usr/local
rm node.tar.gz
```

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```
mkdir ~/bot 
cd ~/bot
wget https://raw.githubusercontent.com/emmtte/Headless-Raspberry-Pi-Setup/master/package.json
wget https://raw.githubusercontent.com/emmtte/Headless-Raspberry-Pi-Setup/master/.prettierrc
npm install
```

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/quote.svg">

<pre>
binance-api-node : <a href="https://github.com/Ashlar/binance-api-node">https://github.com/Ashlar/binance-api-node</a>
bignumber.js : <a href="https://github.com/MikeMcl/bignumber.js">https://github.com/MikeMcl/bignumber.js</a>
coinmarketcap-api : <a href="https://github.com/tiaanduplessis/coinmarketcap-api">https://github.com/tiaanduplessis/coinmarketcap-api</a>
dropbox : <a href="https://github.com/dropbox/dropbox-sdk-js">https://github.com/dropbox/dropbox-sdk-js</a>
isomorphic-fetch : <a href="https://github.com/matthew-andrews/isomorphic-fetch">https://github.com/matthew-andrews/isomorphic-fetch</a>
nanoid : <a href="https://github.com/ai/nanoid">https://github.com/ai/nanoid</a>
node-schedule : <a href="https://github.com/node-schedule/node-schedule">https://github.com/node-schedule/node-schedule</a>
telegraf : <a href="https://github.com/telegraf/telegraf">https://github.com/telegraf/telegraf</a>
tulind : <a href="https://github.com/TulipCharts/tulipnode">https://github.com/TulipCharts/tulipnode</a>
</pre>

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/x.svg">

```sudo rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>




## PuTTY

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/link-external.svg">

https://www.chiark.greenend.org.uk/~sgtatham/putty/

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/text-size.svg">

https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/package.svg">

https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/putty/Subliminal.reg

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/browser.svg">

```
Terminal > Keyboard
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
 ```
 
<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Pi Hole
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/pi-hole/pi-hole

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
curl -sSL https://install.pi-hole.net | bash
```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Samba
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/samba-team/samba

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
sudo apt-get -y install samba samba-common-bin
cat << EOF | sudo tee -a /etc/samba/smb.conf
[HDD]
comment = Raspberry Pi Hard Drive
path = /media/hdd
read only = no
browsable = yes
EOF
sudo service smbd restart
sudo smbpasswd -a pi
```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Telegram
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/link-external.svg">

https://telegram.me/botfather



<pre>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/list-ordered.svg">
<b>1.</b> Use the <b>/newbot</b> command to create a new bot.
   The BotFather will ask you for a name and username, then generate an authorization token for your new bot.  
<b>2.</b> The <b>name</b> of your bot is displayed in contact details and elsewhere.  
<b>3.</b> The <b>Username</b> is a short name, to be used in mentions and telegram.me links.
   Usernames are 5-32 characters long and are case insensitive, but may only include Latin characters,
   numbers, and underscores. Your bot's username must end in ‘bot’.  
<b>4.</b> Copy the <b>TOKEN</b> to the configuration file .env or config.json
<b>5.</b> Send a dummy message to your new bot
<b>6.</b> Go to following url <a href="https://api.telegram.org/bottoken/getUpdates">https://api.telegram.org/bot<b>TOKEN</b>/getUpdates</a>
<b>7.</b> Look for <b>"chat":{"id":</b>
<b>8.</b> Copy the <b>chatid</b> to the configuration file .env or config.json
</pre>

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```
sudo apt-get install -y jq
curl https://api.telegram.org/bot$TELEGRAM_TOKEN/getUpdates | jq .result[0].message.chat.id
```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
	
	
	
## Tmux
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/tmux/tmux

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg">

```sudo apt-get install tmux```</sup>

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
tmux -V
tmux kill-server
sudo apt-get install -y libevent-dev libncurses5-dev
wget https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz
tar xvfz tmux-2.8.tar.gz
cd tmux-2.8
./configure && make
sudo cp ./tmux /usr/bin/tmux
tmux -V
cd ..
rm tmux-2.8.tar.gz
rm -rf tmux-2.8
```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Youtube Download
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/rg3/youtube-dl

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
sudo apt-get -y install libavcodec-extra libav-tools
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
echo "<youtube-dl Playlist Link>" > ~/.youtube-dl
mkdir /medi/hdd/youtube-dl
youtube-dl --output "/media/hdd/youtube-dl/%(title)s.%(ext)s" https://www.youtube.com/playlist?list=`cat ~/.youtube-dl`
```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Youtube Upload
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/tokland/youtube-upload

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/alert.svg">

https://github.com/tokland/youtube-upload/pull/264

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
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
```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Configuration
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/home.svg">

#### Operating System

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```
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
```

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```sudo raspi-config```

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

<pre>
<b>4</b> Localisation Options >  <b>I1</b> Change Locale > fr_FR.UTF-8 UTF-8
<b>4</b> Localisation Options >  <b>I2</b> Change Timezone >  Europe and Time zone : Paris
<b>5</b> Interfacing Options > <b>P1</b> Camera > Disable
<b>7</b> Advanced Options > <b>A1</b> Expand Filesystem
sudo reboot
</pre>

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/person.svg">

#### Username and Password

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

<pre>
sudo passwd root
logout
<i>login as root</i>
usermod -l <b>NewUserName</b> pi
usermod -m -d /home/<b>NewUserName</b> <b>NewUserName</b>
logout
<i>login as <b>NewUserName</b></i>
passwd
sudo apt-get update
sudo passwd -l root
</pre>

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/key.svg">

#### Key-based authentication 

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
ssh-keygen
mv ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
sudo chmod 644 ~/.ssh/authorized_keys
sudo chown $USER:$USER ~/.ssh/authorized_keys
cat << EOF | sudo tee -a /etc/ssh/sshd_config
#AuthorizedKeysFile /home/$USER/.ssh/authorized_keys
UsePAM yes
PermitRootLogin no
PasswordAuthentication no
ChallengeResponseAuthentication no
EOF
sudo service ssh restart
```

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/link-external.svg">

https://www.putty.org/

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/device-desktop.svg">

**puttygen.exe**

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```
Conversions > Import Key > File > id_rsa
Save Private Key > Yes > File > id_rsa.ppk
```

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/globe.svg">

#### Domain Name System

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

<pre>
sudo apt-get install resolvconf
sudo dpkg-reconfigure resolvconf
<i>Prepare /etc/resolv.conf for dynamic updates?</i> No
sudo nvim /etc/resolv.conf
<i>nameserver 127.0.0.1</i>
sudo apt-get install dnsmasq dnsutils
sudo nvim /etc/dhcpcd.conf
<i>interface eth0
  static ip_address=192.168.0.1/24
  static routers=192.168.0.254
  static domain_name_servers=127.0.0.1 8.8.8.8</i>
sudo /etc/init.d/networking restart
/etc/init.d/dnsmasq status
dig api.binance.com
dig @1.1.1.1 api.binance.com +short
</pre>

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/broadcast.svg">

#### Disable Bluetooth and Wifi

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
echo "dtoverlay=pi3-disable-wifi" | sudo tee -a /boot/config.txt
echo "dtoverlay=pi3-disable-bt" | sudo tee -a /boot/config.txt
sudo systemctl disable hciuart
sudo reboot
```

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/sync.svg">

#### Remove Swap File

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove
sudo systemctl disable dphys-swapfile.service

```
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/key.svg">

#### Format USB key

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

<pre>
lsblk
sudo fdisk /dev/sda
<i>d,n,p,1,ENTER,ENTER,t,83,w</i>
sudo mkfs.ext4 /dev/sda1
sudo mkdir /media/key
sudo mount /dev/sda1 /media/key
sudo chown -R $USER:$USER /media/key
mkdir /media/key/influxdb
sudo chown -R influxdb:influxdb /media/key/influxdb
sudo blkid /dev/sda1
sudo mcedit /etc/fstab
PARTUUID=ABCDEFGH-01 /media/key ext4 defaults 0 0 
</pre>

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## License

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/info.svg">

https://github.com/primer/octicons

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/tasklist.svg">

<pre>
MIT License

Copyright (c) Headless-Raspberry-Pi-Setup <i>March 9, 2013</i>
Copyright (c) Infinity-Grid-Trading-Bot   <i>May 1, 2018 </i>

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
</pre>

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
