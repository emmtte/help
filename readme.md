
# Raspberry Pi Headless Setup
  * [Dropbox-Uploader](#dropbox-uploader)
  * [Fuzzy Finder](#fuzzy-finder)
  * [Git](#git)
  * [Google Drive](#google-drive)
  * [Google Music](#google-music-scripts)
  * [Midnight Commander](#midnight-commander)
  * [Neovim](#neovim)
  * [Node JS](#node-js)
  * [Oh My Zsh](#oh-my-zsh)
  * [OpenSSH](#openssh)
  * [Pi Hole](#pi-hole)
  * [PuTTY](#putty)
  * [Raspbian](#raspbian)
  * [Samba](#samba)
  * [Tmux](#tmux)
  * [Youtube Download](#youtube-download)
  * [Youtube Upload](#youtube-upload)
  * [Raspbian Procedures](#raspbian-Procedures)
    - [Disable Bluetooth and Wifi](#disable-bluetooth-and-wifi)
    
#### Prerequisites
````shell
sudo apt-get install gpac libav-tools mkvtoolnix mpv exiv2 rsync ntfs-3g ghostscript
````

<img align="left" width="60" height="60" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

### Dropbox Uploader
https://github.com/andreafabrizi/Dropbox-Uploader  

````shell
sudo curl -o /usr/local/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/local/bin/dropbox_uploader
dropbox_uploader init
````
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>

## Fuzzy Finder
<img align="left" width="25" height="25" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

<pre><a href="https://github.com/junegunn/fzf/#installation">https://github.com/junegunn/fzf/#installation</a></pre>

<img align="left" width="25" height="25" src="https://raw.githubusercontent.com/primer/octicons/master/icons/code.svg">

<pre class="shell">
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
</pre>

<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>

## Git
<img align="left" width="40" height="40" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

<pre><a href="https://github.com/git/git">https://github.com/git/git</a></pre>

<img align="left" width="40" height="40" src="https://raw.githubusercontent.com/primer/octicons/master/icons/zap.svg">

<pre>sudo apt-get install git</pre>

<img align="left" width="40" height="40" src="https://raw.githubusercontent.com/primer/octicons/master/icons/code.svg">

<pre class="shell">
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

<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


## Google Drive
<img align="left" width="20" height="20" img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">

https://github.com/odeke-em/drive

<img align="left" width="40" height="40" src="https://raw.githubusercontent.com/primer/octicons/master/icons/code.svg">

<pre class="shell">
go get -u github.com/odeke-em/drive/cmd/drive
mkdir /media/hdd/drive
drive init /media/hdd/drive
</pre>
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


### Google Music Scripts
![-](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) <sup>https://github.com/thebigmunch/google-music-scripts</sup>
````shell
sudo apt-get install libav-tools #avconv
sudo pip3.7 install -U google-music-scripts
````
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


### Midnight Commander
![-](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) <sup>https://github.com/MidnightCommander/mc</sup>    
![-](https://raw.githubusercontent.com/primer/octicons/master/icons/zap.svg) <sup>```sudo apt-get install mc```</sup>  

![-](https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg) <sup>pi@raspberry</sup>  
<sup>
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
</sup>
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


### Neovim
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) <sup>https://github.com/neovim/neovim</sup>
```shell
sudo apt-get install -y git libtool libtool-bin autoconf automake cmake g++ pkg-config unzip libffi-dev
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


### Node JS
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) <sup>https://github.com/nodejs/nodejs.org</sup>
```shell
VERSION=10.16.0
sudo apt-get -y install build-essential
wget https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-armv7l.tar.gz -O node.tar.gz
sudo tar -xvf node.tar.gz --strip 1 -C /usr/local
rm node.tar.gz
```
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/x.svg) <sup>```uninstall```</sup>
```
sudo rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}
```
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


### Oh My Zsh
![-](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) <sup>https://github.com/ohmyzsh/ohmyzsh</sup>

![-](https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg) <sup>pi@raspberry</sup>  
<sup>
```shell
sudo apt-get install zsh
mkdir $HOME/.antigen
curl -L git.io/antigen > $HOME/.antigen/antigen.zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
/usr/bin/zsh
. ~/.zshrc
```
#### Antigen  
![-](https://raw.githubusercontent.com/primer/octicons/master/icons/rocket.svg) <sup>```Antigen``` https://github.com/zsh-users/antigen</sup>
```
antigen use oh-my-zsh  
antigen apply
```

#### Power Level 10k  
![-](https://raw.githubusercontent.com/primer/octicons/master/icons/rocket.svg) <sup> https://github.com/romkatv/powerlevel10k</sup>  
```
antigen theme romkatv/powerlevel10k
antigen apply
```

#### Zsh Auto Suggestions
[-](https://raw.githubusercontent.com/primer/octicons/master/icons/rocket.svg) <sup> https://github.com/zsh-users/zsh-autosuggestions</sup>
```
antigen bundle zsh-users/zsh-autosuggestions
antigen apply
```

#### Zsh Completions  
![-](https://raw.githubusercontent.com/primer/octicons/master/icons/rocket.svg) <sup> https://github.com/zsh-users/zsh-completions</sup>
```
antigen bundle zsh-users/zsh-completions
antigen apply
```

#### Zsh Syntax Highlighting  
![-](https://raw.githubusercontent.com/primer/octicons/master/icons/rocket.svg) <sup> https://github.com/zsh-users/zsh-syntax-highlighting</sup>
```
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply
```
![-](https://raw.githubusercontent.com/primer/octicons/master/icons/code.svg) <sup>~/.zshrc</sup>  
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>  


### OpenSSH
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) <sup>https://github.com/openssh</sup>
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

#### PuttyGen
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/link-external.svg) <sup>https://www.putty.org/</sup>  
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/device-desktop.svg) <sup>puttygen.exe</sup>
```
Conversions > Import Key > File > id_rsa
Save Private Key > Yes > File > id_rsa.ppk
```
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>  

### PuTTY
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/link-external.svg) <sup>https://www.chiark.greenend.org.uk/~sgtatham/putty/</sup>  
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/text-size.svg) <sup>https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf</sup>  
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/package.svg) <sup>https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/putty/Subliminal.reg</sup>
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
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>

### Pi Hole
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) <sup>https://github.com/pi-hole/pi-hole</sup>
```shell
curl -sSL https://install.pi-hole.net | bash
```
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


### Samba
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) <sup>https://github.com/samba-team/samba</sup>
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
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


### Tmux
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) <sup>https://github.com/tmux/tmux</sup>  
![-](https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg) <sup>```sudo apt-get install tmux```</sup>
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
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


### Youtube Download
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg) <sup>https://github.com/rg3/youtube-dl</sup>
```shell
sudo apt-get -y install libavcodec-extra libav-tools
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
echo "<youtube-dl Playlist Link>" > ~/.youtube-dl
mkdir /medi/hdd/youtube-dl
youtube-dl --output "/media/hdd/youtube-dl/%(title)s.%(ext)s" https://www.youtube.com/playlist?list=`cat ~/.youtube-dl`
```
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


### Youtube Upload
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg)  <sup>https://github.com/tokland/youtube-upload</sup>  
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/alert.svg) <sup>https://github.com/tokland/youtube-upload/pull/264</sup>

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
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


### Raspbian Procedures
#### Disable Bluetooth and Wifi
```shell
echo "dtoverlay=pi3-disable-wifi" | sudo tee -a /boot/config.txt
echo "dtoverlay=pi3-disable-bt" | sudo tee -a /boot/config.txt
sudo systemctl disable hciuart
sudo reboot
```
<div align="right"><a href="#raspberry-pi-headless-setup">
<img src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>


### License
![Alt text](https://raw.githubusercontent.com/primer/octicons/master/icons/info.svg)  <sup>https://github.com/primer/octicons</sup>  

MIT License

Copyright (c) ```2014-2020``` ```emmtte```

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

