
# Headless Raspberry Pi Setup

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/list-unordered.svg">
<pre>
<b>Setup</b>
  • <a href="#dropbox-uploader">Dropbox-Uploader</a>
  • <a href="#fuzzy-finder">Fuzzy Finder</a>
  • <a href="#git">Git</a>
  • <a href="#google-drive">Google Drive</a>
  • <a href="#google-music-scripts">Google Music</a>
  • <a href="#grafana">Grafana</a>
  • <a href="#influxdb">InfluxDB</a>
  • <a href="#midnight-commander">Midnight Commander</a>
  • <a href="#neovim">Neovim</a>
  • <a href="#node-js">Node JS</a>
  • <a href="#oh-my-zsh">Oh My Zsh</a>
  • <a href="#pi-hole">Pi Hole</a>
  • <a href="#putty">PuTTY</a>
  • <a href="#samba">Samba</a>
  • <a href="#telegram">Telegram</a>
  • <a href="#tmux">Tmux</a>
  • <a href="#youtube-download">Youtube Download</a>
  • <a href="#youtube-upload">Youtube Upload</a>
<b>Configuration</b>
  • <a href="#username-and-password">Username and Password</a> 
  • <a href="#key-based-authentication">Key-based authentication</a> 
  • <a href="#domain-name-system">Domain Name System</a>
  • <a href="#disable-bluetooth-and-wifi">Disable Bluetooth and Wifi</a>
  • <a href="#format-usb-key">Format USB Key</a>
</pre>

<summary>
</summary>

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg">

```sudo apt-get install gpac libav-tools mkvtoolnix mpv exiv2 rsync ntfs-3g ghostscript```

<div align="right"><a href="#license">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/info.svg"></a></div>



## Dropbox Uploader
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/andreafabrizi/Dropbox-Uploader

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
sudo curl -o /usr/local/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/local/bin/dropbox_uploader
dropbox_uploader init
```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Fuzzy Finder

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/junegunn/fzf

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/file-code.svg">

```shell
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Git
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/git/git

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg">

```sudo apt-get install git```

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
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
````

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
wget https://dl.grafana.com/oss/release/grafana_6.7.0_armhf.deb 
sudo dpkg -i grafana_6.7.0_armhf.deb
rm grafana_6.7.0_armhf.deb
sudo nvim /etc/grafana/grafana.ini
```

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/file-code.svg">

````
[server]
  # Protocol (http, https, socket)
  protocol = http
  # The ip address to bind to, empty will bind to all interfaces
  ;http_addr =
  # The http port  to use
  http_port = 3000
  Start grafana server
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
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.7.9_armhf.deb
sudo dpkg -i influxdb_1.7.9_armhf.deb
rm influxdb_1.7.9_armhf.deb
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

 ```shell
sudo apt-gen install autogen autoconf libtool gettext libslang2-dev
wget https://github.com/MidnightCommander/mc/archive/4.8.20.tar.gz
tar xvfz 4.8.20.tar.gz
cd mc-4.8.20
autoconf
./configure
make
make install
```

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

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/quote.svg">

```json
{
  "name": "Infinity-Grid-Trading-Bot",
  "version": "1.0.0",
  "dependencies": {
    "binance-api-node": "latest",
    "bignumber.js": "latest",
    "coinmarketcap-api": "latest",
    "dropbox": "latest",
    "isomorphic-fetch": "latest",
    "nanoid": "latest",
    "node-schedule": "latest",
    "telegraf": "latest",
    "tulind": "latest"
  }
}
```

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/quote.svg">

<pre>
binance-api-node : https://github.com/Ashlar/binance-api-node
bignumber.js : https://github.com/MikeMcl/bignumber.js
coinmarketcap-api : https://github.com/tiaanduplessis/coinmarketcap-api
dropbox : https://github.com/dropbox/dropbox-sdk-js
isomorphic-fetch : https://github.com/matthew-andrews/isomorphic-fetch
nanoid : https://github.com/ai/nanoid
node-schedule : https://github.com/node-schedule/node-schedule
telegraf : https://github.com/telegraf/telegraf
tulind : https://github.com/TulipCharts/tulipnode
</pre>

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/x.svg">

```sudo rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## Oh My Zsh
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/ohmyzsh/ohmyzsh

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg">

```sudo apt-get install zsh```

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir $HOME/.antigen
curl -L git.io/antigen > $HOME/.antigen/antigen.zsh
/usr/bin/zsh
. ~/.zshrc
```

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/rocket.svg">

<pre>
<a href="https://github.com/zsh-users/antigen">https://github.com/zsh-users/antigen</a>
<a href="https://github.com/romkatv/powerlevel10k">https://github.com/romkatv/powerlevel10k</a>
<a href="https://github.com/zsh-users/zsh-autosuggestions">https://github.com/zsh-users/zsh-autosuggestions</a>
<a href="https://github.com/zsh-users/zsh-completions">https://github.com/zsh-users/zsh-completions</a>
<a href="https://github.com/zsh-users/zsh-syntax-highlighting">https://github.com/zsh-users/zsh-syntax-highlighting</a>
</pre>

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/file-code.svg">

```
antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply
```

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```p10k configure```

<div align="right"><a href="#headless-raspberry-pi-setup">
<img  width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>



## OpenSSH
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/openssh

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
Window > Apprearance
	Font: MesloLGS NF, 11-point
        [X] Allow selection of variable-pith fonts
	Font quality:
		( ) Antialiased     ( ) Non-Antialiased
		(O) ClearType       ( ) Default
Window > Colours
	[X] Allow terminal to specify ANSI colours
	[X] Allow terminal to use xterm 256-colour mode
	Indicate bolded text by changing:
		( ) The font   (O) The colour   ( ) Both
	[ ] Attempt to use logical palettes
	[ ] Use system colours
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



## Telegram Bot
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/link-external.svg">

https://telegram.me/botfather

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/list-ordered.svg">

<pre>
<b>1.</b> Use the <b>/newbot</b> command to create a new bot.
   The BotFather will ask you for a name and username, then generate an authorization token for your new bot.  
<b>2.</b> The <b>name</b> of your bot is displayed in contact details and elsewhere.  
<b>3.</b> The <b>Username</b> is a short name, to be used in mentions and telegram.me links.
   Usernames are 5-32 characters long and are case insensitive, but may only include Latin characters,
   numbers, and underscores. Your bot's username must end in ‘bot’.  
<b>4.</b> Copy the <b>TOKEN</b> to the configuration file .env or config.json
<b>5.</b> Send a dummy message to your new bot
<b>6.</b> Go to following url <a href="https://api.telegram.org/bottoken/getUpdates">https://api.telegram.org/<b>TOKEN</b>/getUpdates</a>
<b>7.</b> Look for <b>"chat":{"id":</b>
<b>8.</b> Copy the chatid to the configuration file .env or config.json
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



## Raspbian Procedures
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/broadcast.svg">

**Disable Bluetooth and Wifi**

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">

```shell
echo "dtoverlay=pi3-disable-wifi" | sudo tee -a /boot/config.txt
echo "dtoverlay=pi3-disable-bt" | sudo tee -a /boot/config.txt
sudo systemctl disable hciuart
sudo reboot
```

<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/key.svg">

**Format USB key**

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

Copyright (c) <i>2014-2020 emmtte</i>

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
