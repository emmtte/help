
# Raspberry Pi Headless Setup
  * [Dropbox-Uploader](#dropbox-uploader)
  * [Git](#git)
  * [Google Drive](#google-drive)
  * [Google Music](#google-music-scripts)
  * [Midnight Commander](#midnight-commander)
  * [Neovim](#neovim)
  * [Node.js](#node.js)
  * [Oh My Zsh](#oh-my-zsh)
  * [OpenSSH](#openssh)
  * [Pi Hole](#pi-hole)
  * [Raspbian](#raspbian)
  * [Samba](#samba)
  * [Tmux](#tmux)
  * [Wifi & Bluetooth](#disable-bt-and-wifi)
  * [Youtube Download](#youtube-download)
  * [Youtube Upload](#youtube-upload)
  * [Raspbian Procedures](#raspbian-Procedures)
    - [Disable Bluetooth and Wifi](#disable-bluetooth-and-wifi)
    
Prerequisites
````shell
sudo apt-get install gpac libav-tools mkvtoolnix mpv exiv2 rsync ntfs-3g ghostscript
````

### Dropbox Uploader
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/andreafabrizi/Dropbox-Uploader
````shell
sudo curl -o /usr/local/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/local/bin/dropbox_uploader
dropbox_uploader init
````

### Git
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/git/git
````shell
sudo apt-get install git
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

### Google Drive
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/odeke-em/drive
````shell
go get -u github.com/odeke-em/drive/cmd/drive
mkdir /media/hdd/drive
drive init /media/hdd/drive
````

### Google Music Scripts
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/thebigmunch/google-music-scripts
````shell
sudo apt-get install libav-tools #avconv
sudo pip3.7 install -U google-music-scripts
````

### Midnight Commander
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/MidnightCommander/mc
````shell
sudo apt-get install mc
````
or
````shell
sudo apt-gen install autogen autoconf libtool gettext libslang2-dev
wget https://github.com/MidnightCommander/mc/archive/4.8.20.tar.gz
tar xvfz 4.8.20.tar.gz
cd mc-4.8.20
autoconf
./configure
make
make install
````

### Neovim
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/neovim/neovim
````shell
sudo apt-get install -y git libtool libtool-bin autoconf automake cmake g++ pkg-config unzip libffi-dev
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
````

### Node.JS
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/nodejs/nodejs.org
````shell
VERSION=10.16.0
sudo apt-get -y install build-essential
wget https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-armv7l.tar.gz -O node.tar.gz
sudo tar -xvf node.tar.gz --strip 1 -C /usr/local
rm node.tar.gz
````

### Oh My Zsh
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/ohmyzsh/ohmyzsh
````shell
sudo apt-get install zsh
mkdir $HOME/.antigen
curl -L git.io/antigen > $HOME/.antigen/antigen.zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
/usr/bin/zsh
. ~/.zshrc
````

### OpenSSH
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/openssh
````shell
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
````

PuttyGen.exe
- Conversions => Import Key (id_rsa)
- Save Private Key and Yes to save without a passphrase.
- Choose a location and a name for the new .ppk key

### Pi Hole
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/pi-hole/pi-hole
````shell
curl -sSL https://install.pi-hole.net | bash
````

### Samba
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/samba-team/samba
````shell
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
````

### Tmux
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/tmux/tmux
````shell
sudo apt-get install tmux
````
````shell
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
````

### Youtube Download
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/rg3/youtube-dl
````shell
sudo apt-get -y install libavcodec-extra libav-tools
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
echo "<youtube-dl Playlist Link>" > ~/.youtube-dl
mkdir /medi/hdd/youtube-dl
youtube-dl --output "/media/hdd/youtube-dl/%(title)s.%(ext)s" https://www.youtube.com/playlist?list=`cat ~/.youtube-dl`
````

### Youtube Upload
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) https://github.com/tokland/youtube-upload

![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/alert.svg) https://github.com/tokland/youtube-upload/pull/264

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

### Raspbian Procedures
#### Disable Bluetooth and Wifi
````shell
echo "dtoverlay=pi3-disable-wifi" | sudo tee -a /boot/config.txt
echo "dtoverlay=pi3-disable-bt" | sudo tee -a /boot/config.txt
sudo systemctl disable hciuart
sudo reboot
````

### License

MIT License

Copyright (c) ````2014-2020```` ````emmtte````

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

