# Headless Raspberry Pi Setup

##### Prerequisites
```shell
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt install -y ntp rsync ntfs-3g fail2ban
sudo apt install -y gpac libav-tools mkvtoolnix mpv ghostscript
```
**Change Hostname**
```shell
hostnamectl set-hostname <hostname>
sudo nvim /etc/hosts
>>> replace raspberrypi by <hostname>
```

**Auto Start**
```shell
sudo nvim /etc/rc.local
  su pi -c "/usr/bin/bash /home/pi/headless.sh" &
  exit 0
```
```shell
nvim ~/.profile
  ~/headless.sh
```


## Bitwarden
- https://bitwarden.com/help/article/cli/#download-and-install
````
sudo yarn global add @bitwarden/cli
bw login [email] [password]
export BW_SESSION="[token]"
bw export --format csv
bw export --format json
gpg -c bitwarden_export.csv
gpg -c bitwarden_export.json
bw lock
````

## Dropbox Uploader
- https://github.com/andreafabrizi/Dropbox-Uploader
```
sudo curl -o /usr/local/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/local/bin/dropbox_uploader
dropbox_uploader init
```


## Go Language
- https://github.com/golang/go
```
VERSION=1.14.6.linux-armv6l
curl -L -o go$VERSION.tar.gz https://storage.googleapis.com/golang/go$VERSION.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.tar.gz
cat &lt;&lt; ! &gt;&gt; ~/.bashrc
export GOPATH=\$HOME/go
export PATH=\$GOPATH:\$GOPATH/bin:\$PATH
!
source ~/.bashrc
```

## Google Drive
- https://github.com/odeke-em/drive
```
sudo apt install -y git
go get -u github.com/odeke-em/drive/cmd/drive
mkdir /media/hdd/drive
drive init /media/hdd/drive
```

## Kodi
- https://github.com/xbmc/xbmc
````
sudo apt-get install kodi kodi-inputstream-adaptive kodi-inputstream-rtmp kodi-eventclients-kodi-send
sudo nvim /boot/config.txt
hdmi_ignore_cec_init=1
gpu_mem=512
dtparam=audio=on
dtoverlay=vc4-fkms-v3d
disable_overscan=1
nvim /home/pi/.kodi/userdata/keymaps/remote.xml
<keymap><global><remote><red>contextmenu</red></remote></global></keymap>
````

## Midnight Commander
- https://github.com/MidnightCommander/mc
```
sudo apt install -y mc
sudo apt install -y autogen autoconf libtool gettext libslang2-dev autopoint glib2.0
wget http://ftp.midnight-commander.org/mc-4.8.25.tar.xz
tar xf mc-4.8.25.tar.xz
cd mc-4.8.25
./configure
make -j3
sudo make install
cd..
rm mc-4.8.25.tar.xz
rm -rf mc-4.8.25
```
####Select Editor
```
echo "SELECTED_EDITOR='/usr/local/bin/nvim'" | tee -a ~/.selected_editor
```


## Neovim
- https://github.com/neovim/neovim
```shell
sudo apt install cmake libtool-bin
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo -j3
sudo make install
cd ..
rm -rf neovim
```
#### Exuberant Ctags
- https://github.com/romainl/ctags-patterns-for-javascript
```
sudo apt-get install exuberant-ctags
wget https://raw.githubusercontent.com/romainl/ctags-patterns-for-javascript/master/ctagsrc -O /home/pi/~/.ctags
ctags -R
```
#### neovim-remote
- https://github.com/mhinz/neovim-remote
```
sudo apt install -y python3-pip
sudo pip3 install neovim-remote
NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim
```
#### vimv
- https://github.com/thameera/vimv
```
sudo curl -o /usr/local/bin/vimv https://raw.githubusercontent.com/thameera/vimv/master/vimv
sudo chmod +x /usr/local/bin/vimv
cd <directory to rename>
vimv
```
#### Plugins
- https://github.com/junegunn/vim-plug
- https://github.com/neoclide/coc.nvim
- https://github.com/drewtempelmeyer/palenight.vim
- https://github.com/vim-airline/vim-airline
- https://github.com/edkolev/tmuxline.vim
- https://github.com/majutsushi/tagbar


## Node JS
- https://github.com/nodejs/node
- https://github.com/yarnpkg/yarn
```
VERSION=15.13.0
sudo apt -y install build-essential
#wget https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-armv7l.tar.gz -O node.tar.gz
wget https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-arm64.tar.gz -O node.tar.gz
sudo tar -xvf node.tar.gz --strip 1 -C /usr/local
rm node.tar.gz
sudo npm install --global yarn
```
**Infinity Grid Trading Bot**
```
mkdir ~/binance
cp {.env,package.json,.prettierrc,.eslintrc.json} /home/pi/binance
cd binance
yarn install
yarn add --save-dev eslint prettier eslint-config-prettier eslint-plugin-prettier
yarn upgrade
```

**Uninstall**
```
sudo rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}
```


## Pi Hole
- https://github.com/pi-hole/pi-hole
````
curl -sSL https://install.pi-hole.net | bash
````


## PuTTY
- https://www.chiark.greenend.org.uk/~sgtatham/putty/
- https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
- https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/putty/Subliminal.reg

```
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
```


Download and install the DejaVu font in Windows.
Run PuTTY and create a new session with the following settings
Window-Appearance-Font = DejaVu Sans Mono for Powerline
Verify your linux locale LANG=en_US.UTF-8
Verify that your .vimrc has "set encoding=utf-8"
Verify your term session is capable of 256 colors (TERM=xterm-256color)

## Ready Media
- https://sourceforge.net/projects/minidlna/
```
sudo apt install -y minidlna
sudo nvim /etc/minidlna.conf
  root_container=B
  friendly_name=Raspberry Pi
  media_dir=/media/hdd/minidlna
sudo service minidlna restart
sudo chmod a+rX /media/hdd/minidlna
```


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
#### Private Channel
To send messages to your private channels you have to get your channel’s internal ID:
1. Convert your channel to public with some **@channelName**
2. Send message to this channel through Bot API https://api.telegram.org/botTOKEN/sendMessage?chat_id=@channelName&text=test
3. As response you will get info with chat_id of your channel.
{ "ok" : true, "result" : { "chat" : { "id" : -1000000000000, "title" : "Private Channel", "type" : "channel" }, "date" : 000000000, "message_id" : 1, "text" : "test" } }
4. Now you can convert your Channel back to private and send message directly to this chat_id "-1000000000000" (minus is important!)
https://api.telegram.org/botTOKEN/sendMessage?chat_id=-1000000000000&text=test

## Telegram-upload
- https://github.com/Nekmo/telegram-upload
````
sudo pip3 install -U telegram-upload
youtube-dl -f 'bestvideo[width<=640]+bestaudio/best[width<=640]'
ffmpeg -i video.mp4 -vcodec copy -acodec copy fixed.mp4
telegram-upload fixed.mp4 --caption fixed.mp4
````

## Tmux
- https://github.com/tmux/tmux
````
sudo apt install -y tmux
tmux -V
tmux kill-server
sudo apt install -y libevent-dev libncurses5-dev
wget https://github.com/tmux/tmux/releases/download/3.1c/tmux-3.1c.tar.gz
tar xvfz tmux-3.1c.tar.gz
cd tmux-3.1c
./configure
make -j3
sudo make install
cd ..
rm -rf tmux-3.1c
rm tmux-3.1c.tar.gz
````


## Youtube Download
- https://github.com/rg3/youtube-dl
```
sudo apt -y install libavcodec-extra ffmpeg
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
sudo  youtube-dl -U
```


## Youtube Upload
- https://github.com/tokland/youtube-upload
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


## Configuration
#### Create SD Card
```shell
rm /home/pi/raspios.zip
curl --progress-bar -L -o /home/pi/raspios.zip https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2021-01-12/2021-01-11-raspios-buster-armhf-lite.zip
curl --progress-bar -L -o /home/pi/raspios-arm64.zip https://downloads.raspberrypi.org/raspios_arm64/images/raspios_arm64-2020-08-24/2020-08-20-raspios-buster-arm64.zip
lsblk
unzip -p /home/pi/raspios.zip | sudo dd of=/dev/sda bs=4M status=progress conv=fsync
unzip -p /home/pi/raspios-arm64.zip | sudo dd of=/dev/sda bs=4M status=progress conv=fsync
sudo mkdir /media/sd
sudo mount /dev/sda1 /media/sd
sudo touch /media/sd/ssh
sudo umount /media/sd
```

#### Configuration

```sudo raspi-config```

- **1** Change User Password
- **4** Localisation Options **>** **I1** Change Locale **>** fr_FR.UTF-8 UTF-8
- **4** Localisation Options **>** **I2** Change Timezone **>**  Europe and Time zone : Paris
- **5** Interfacing Options **>** **P1** Camera > Disable
- **7** Advanced Options **>** **A1** Expand Filesystem

````
1 System Options Configure system settings
S4 Hostname          Set name for this computer on a network

2 Display Options      Configure display settings
D2 Underscan       Remove black border around screen
Would you like to enable compensation for displays with overscan? No

4 Performance Options  Configure performance settings
P2 GPU Memory          Change the amount of memory made available to the GPU

6 Advanced Options     Configure advanced settings
A2 GL Driver               Enable/disable experimental desktop GL driver
G1 Legacy        Original non-GL desktop driver
````

#### Key-based authentication
```
mkdir .ssh
cd .ssh
touch authorized_keys
nano authorized_keys
sudo chmod 644 ~/.ssh/authorized_keys
sudo chown $USER:$USER ~/.ssh/authorized_keys

ssh-keygen
mv ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
sudo chmod 644 ~/.ssh/authorized_keys
sudo chown $USER:$USER ~/.ssh/authorized_keys
sudo nvim /etc/ssh/sshd_config
>>> PermitRootLogin no
>>> PasswordAuthentication no
sudo service ssh restart
```

 - https://www.putty.org/

**puttygen.exe**


```
Conversions &gt;> Import Key &gt;> File &gt;> id_rsa
Save Private Key &gt;> Yes &gt;> File &gt;> id_rsa.ppk
```

#### Domain Name System
## DNS Server
**Installation**
````
sudo apt install dnsmasq
sudo nvim /etc/dnsmasq.conf
  domain-needed
  bogus-priv
  no-resolv
  cache-size=1000
  server=1.1.1.1
  server=1.0.0.1
  server=8.8.8.8
  server=8.8.4.4
sudo systemctl restart dnsmasq
sudo systemctl status dnsmasq
````

**Configuration**
````
sudo nvim /etc/dhcp/dhclient.conf
  prepend domain-name-servers 127.0.0.1;
  #prepend domain-name-servers 127.0.0.1, 1.1.1.1, 1.0.0.1, 8.8.8.8, 8.8.4.4;
sudo service networking restart
````

**Test**
````
sudo apt install -y dnsutils
dig www.google.com
dig www.google.com @localhost
dig @1.1.1.1 www.google.com +short
sudo tail -n 200 /var/log/syslog
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

#### Format or Install HDD or KEY
```
lsblk
sudo fdisk /dev/sda
```
**Press keys** : *d, n, p, 1, ENTER, ENTER, t, 83, w*
**Press keys** : *d, n, p, 1, +265.8G, n,p,2, w*
```
lsblk
#sudo mkfs.ext4 /dev/sda1 
#sudo mkfs.ext4 /dev/sdb1
sudo mkfs.ext4 -E lazy_itable_init=0,lazy_journal_init=0 /dev/sda1
sudo mkfs.ext4 -E lazy_itable_init=0,lazy_journal_init=0 /dev/sdb1
sudo mkdir /media/key
sudo mkdir /media/hdd
sudo mount /dev/sda1 /media/hdd
sudo mount /dev/sdb1 /media/key
sudo mount /dev/sda2 /mnt/hdd
#sudo chown -R $USER:$USER /media/key
sudo blkid /dev/sda1
sudo blkid /dev/sdb1
sudo nvim /etc/fstab
UUID=7157e807-4902-4a3a-93e2-901ee840e092 /media/hdd ext4 nofail,defaults 0 0
```


## MIT License

- Copyright (c) Headless-Raspberry-Pi-Setup *March 9, 2013*
- Copyright (c) Infinity-Grid-Trading-Bot *May 1, 2018*

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
