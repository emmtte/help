---


---

<h1 id="headless-raspberry-pi-setup">Headless Raspberry Pi Setup</h1>
<p><strong>Setup</strong><br>
• <a href="#dropbox-uploader">Dropbox-Uploader</a><br>
• <a href="#git">Git</a><br>
• <a href="#go-language">Go Language</a><br>
• <a href="#google-drive">Google Drive</a><br>
• <a href="#google-music-scripts">Google Music</a><br>
• <a href="#grafana">Grafana</a><br>
• <a href="#influxdb">InfluxDB</a><br>
• <a href="#midnight-commander">Midnight Commander</a><br>
• <a href="#neovim">Neovim</a><br>
• <a href="#node-js">Node JS</a><br>
• <a href="#pi-hole">Pi Hole</a><br>
• <a href="#putty">PuTTY</a><br>
• <a href="#samba">Samba</a><br>
• <a href="#telegram">Telegram</a><br>
• <a href="#tmux">Tmux</a><br>
• <a href="#youtube-download">Youtube Download</a><br>
• <a href="#youtube-upload">Youtube Upload</a><br>
<strong>Configuration</strong><br>
• <a href="#"></a></p>
<p>• <a href="#operating-system">Operating System</a><br>
• <a href="#username-and-password">Username and Password</a><br>
• <a href="#key-based-authentication">Key-based authentication</a><br>
• <a href="#domain-name-system">Domain Name System</a><br>
• <a href="#disable-bluetooth-and-wifi">Disable Bluetooth and Wifi</a><br>
• <a href="#remove-swap-file">Remove Swap File</a><br>
• <a href="#format-usb-key">Format USB Key</a><br>
<br>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg"><br>
info</p>
<p><img src="https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg" alt="image">&nbsp;&nbsp;<code>sudo apt-get install gpac libav-tools mkvtoolnix mpv exiv2 rsync ntfs-3g ghostscript</code></p>
<div align="right"><a href="#license">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/info.svg"></a></div>
<h2 id="dropbox-uploader">Dropbox Uploader</h2>
<p><img src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg" alt="" width="19" height="19">&nbsp;&nbsp;<a href="https://github.com/andreafabrizi/Dropbox-Uploader">https://github.com/andreafabrizi/Dropbox-Uploader</a></p>
<pre><img width="19" height="19" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg"> sudo curl -o /usr/local/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/local/bin/dropbox_uploader
dropbox_uploader init
</pre>
<div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="git">Git</h2>
<div align="left"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16"><path fill-rule="evenodd" d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path></svg>&nbsp;<a href="https://github.com/git/git">https://github.com/git/git</a></div>
<div align="left"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16"><path fill-rule="evenodd" d="M1.75 1.5a.25.25 0 00-.25.25v9.5c0 .138.112.25.25.25h2a.75.75 0 01.75.75v2.19l2.72-2.72a.75.75 0 01.53-.22h6.5a.25.25 0 00.25-.25v-9.5a.25.25 0 00-.25-.25H1.75zM0 1.75C0 .784.784 0 1.75 0h12.5C15.216 0 16 .784 16 1.75v9.5A1.75 1.75 0 0114.25 13H8.06l-2.573 2.573A1.457 1.457 0 013 14.543V13H1.75A1.75 1.75 0 010 11.25v-9.5zM9 9a1 1 0 11-2 0 1 1 0 012 0zm-.25-5.25a.75.75 0 00-1.5 0v2.5a.75.75 0 001.5 0v-2.5z"></path></svg>&nbsp;sudo apt-get install git</div>
<pre align="left"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16"><path fill-rule="evenodd" d="M0 2.75C0 1.784.784 1 1.75 1h12.5c.966 0 1.75.784 1.75 1.75v10.5A1.75 1.75 0 0114.25 15H1.75A1.75 1.75 0 010 13.25V2.75zm1.75-.25a.25.25 0 00-.25.25v10.5c0 .138.112.25.25.25h12.5a.25.25 0 00.25-.25V2.75a.25.25 0 00-.25-.25H1.75zM7.25 8a.75.75 0 01-.22.53l-2.25 2.25a.75.75 0 11-1.06-1.06L5.44 8 3.72 6.28a.75.75 0 111.06-1.06l2.25 2.25c.141.14.22.331.22.53zm1.5 1.5a.75.75 0 000 1.5h3a.75.75 0 000-1.5h-3z"></path></svg>
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
</pre>
<div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="go-language">Go Language</h2>
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16"><path fill-rule="evenodd" d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path></svg>&nbsp;<a href="https://github.com/golang/go">https://github.com/golang/go</a>
<img align="left" width="" height="20" src="https://github/icons/terminal.svg">
VERSION=1.14.2.linux-armv6l
curl -L -o go$VERSION.tar.gz https://storage.googleapis.com/golang/go$VERSION.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.tar.gz
cat &lt;&lt; ! &gt;&gt; ~/.bashrc
export GOPATH=\$HOME/go
export PATH=\$GOPATH:\$GOPATH/bin:\$PATH
!
source ~/.bashrc
<div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="google-drive">
Google Drive</h2>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/code.svg">
<pre class="shell">go get -u github.com/odeke-em/drive/cmd/drive
mkdir /media/hdd/drive
drive init /media/hdd/drive
</pre>
<div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="google-music-scripts">
Google Music Scripts</h2><img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">
<p><a href="https://github.com/thebigmunch/google-music-scripts">
https://github.com/thebigmunch/google-music-scripts</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre class="  language-shell"><code class="prism  language-shell">
sudo apt-get install libav-tools #avconv
sudo pip3.7 install -U google-music-scripts
</code></pre><div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="grafana">
</h2><h2 id="grafanah2img-alignleft-width20-height20-srchttpsraw.githubusercontent.comprimerocticonsmastericonsrepo.svg">Grafana</h2><img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">
<p><a href="https://github.com/grafana/grafana">
https://github.com/grafana/grafana
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/oss/release/grafana_7.0.1_armhf.deb
sudo dpkg -i grafana_7.0.1_armhf.deb
rm grafana_7.0.1_armhf.deb
sudo nvim /etc/grafana/grafana.ini

<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/file-code.svg">
</a></p><pre><code>
[server]
  # Protocol (http, https, socket)
  protocol = http
  # The http port  to use
  http_port = 3000
</code></pre><p></p><img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre><code>
sudo service grafana-server restart
</code></pre><img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/link-external.svg">
<p><a href="http://localhost:3000/login">
http://localhost:3000/login</a> (default admin/admin)</p>
<div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="influxdb">
InfluxDB</h2>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">
<p><a href="https://github.com/influxdata/influxdb">https://github.com/influxdata/influxdb
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
</a></p><pre><code>
VERSION=1.8.0
wget https://dl.influxdata.com/influxdb/releases/influxdb_$VERSION_armhf.deb
sudo dpkg -i influxdb_$VERSION_armhf.deb
rm influxdb_$VERSION_armhf.deb
sudo nvim /etc/influxdb/influxdb.conf
</code></pre>```
<p></p><img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/file-code.svg">
<pre><code>
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
</code></pre><div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="midnight-commander">
Midnight Commander</h2>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">
<p><a href="https://github.com/MidnightCommander/mc">https://github.com/MidnightCommander/mc</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg">
<p><code>sudo apt-get install mc</code></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">&gt;sudo apt-gen install autogen autoconf libtool gettext libslang2-dev
wget https://github.com/MidnightCommander/mc/archive/4.8.20.tar.gz
tar xvfz 4.8.20.tar.gz
cd mc-4.8.20
autoconf
./configure
make
make install
<p><b>Optional Skin</b><br>
wget -O ~/.local/share/mc/skins/ <br>
<a href="https://raw.githubusercontent.com/emmtte/Headless-Raspberry-Pi-Setup/master/.local/share/mc/skins/palenight.ini">https://raw.githubusercontent.com/emmtte/Headless-Raspberry-Pi-Setup/master/.local/share/mc/skins/palenight.ini</a><br>
nvim ~/.config/mc/ini</p>
<p><i>[Midnight Commander]<br>
skin=palenight</i></p>
<p><b>Selected Editor</b><br>
echo “SELECTED_EDITOR=’/usr/local/bin/nvim’” | tee -a ~/.selected_editor<br>
</p>
<div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="neovim">
Neovim</h2>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">
<p><a href="https://github.com/neovim/neovim">
https://github.com/neovim/neovim</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre class="  language-shell"><code class="prism  language-shell">
```shell
sudo apt-get install -y git libtool libtool-bin autoconf automake cmake g++ pkg-config unzip libffi-dev
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
</code></pre>```
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/rocket.svg">
<h4 id="universal-ctags">
Universal Ctags</h4>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">
<p><a href="
https://github.com/universal-ctags/ctags">https://github.com/universal-ctags/ctags</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/file-code.svg">
<pre>git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install
ctags -R
</pre><img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/rocket.svg">
<pre><a href="https://github.com/junegunn/vim-plug">https://github.com/junegunn/vim-plug</a>
<a href="https://github.com/neoclide/coc.nvim">https://github.com/neoclide/coc.nvim</a>
<a href="https://github.com/drewtempelmeyer/palenight.vim">https://github.com/drewtempelmeyer/palenight.vim</a>
<a href="https://github.com/vim-airline/vim-airline">https://github.com/vim-airline/vim-airline</a>
<a href="https://github.com/edkolev/tmuxline.vim">https://github.com/edkolev/tmuxline.vim</a>
<a href="https://github.com/majutsushi/tagbar">https://github.com/majutsushi/tagbar</a>
</pre>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/file-code.svg">
<pre>nvim ~/.config/nvim/init.vim
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
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="node-js">
</h2><h2 id="node-jsh2">Node JS</h2>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">
<p><a href="
https://github.com/nodejs/node">https://github.com/nodejs/node</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre class="  language-shell"><code class="prism  language-shell">
VERSION=14.0.0
sudo apt-get -y install build-essential
wget https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-armv7l.tar.gz -O node.tar.gz
sudo tar -xvf node.tar.gz --strip 1 -C /usr/local
rm node.tar.gz
</code></pre>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre><code>
mkdir ~/bot 
cd ~/bot
wget https://raw.githubusercontent.com/emmtte/Headless-Raspberry-Pi-Setup/master/package.json
wget https://raw.githubusercontent.com/emmtte/Headless-Raspberry-Pi-Setup/master/.prettierrc
npm install
</code></pre><pre>binance-api-node : <a href="https://github.com/Ashlar/binance-api-node">https://github.com/Ashlar/binance-api-node</a>
bignumber.js : <a href="https://github.com/MikeMcl/bignumber.js">https://github.com/MikeMcl/bignumber.js</a>
coinmarketcap-api : <a href="https://github.com/tiaanduplessis/coinmarketcap-api">https://github.com/tiaanduplessis/coinmarketcap-api</a>
dropbox : <a href="https://github.com/dropbox/dropbox-sdk-js">https://github.com/dropbox/dropbox-sdk-js</a>
isomorphic-fetch : <a href="https://github.com/matthew-andrews/isomorphic-fetch">https://github.com/matthew-andrews/isomorphic-fetch</a>
nanoid : <a href="https://github.com/ai/nanoid">https://github.com/ai/nanoid</a>
node-schedule : <a href="https://github.com/node-schedule/node-schedule">https://github.com/node-schedule/node-schedule</a>
telegraf : <a href="https://github.com/telegraf/telegraf">https://github.com/telegraf/telegraf</a>
tulind : <a href="https://github.com/TulipCharts/tulipnode">https://github.com/TulipCharts/tulipnode</a>
</pre><img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/x.svg">
<p><code>
```sudo rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}</code></p><div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="putty">PuTTY</h2>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/link-external.svg">
<p><a href="https://www.chiark.greenend.org.uk/~sgtatham/putty/">
https://www.chiark.greenend.org.uk/~sgtatham/putty/</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/text-size.svg">
<p><a href="https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf">https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Regular.ttf</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/package.svg">
<p><a href="
https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/putty/Subliminal.reg">https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/putty/Subliminal.reg</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/browser.svg">
<pre><code>
```
Terminal &gt; Keyboard
        The Function keys and keypad
	        ( ) ESC[n~  ( ) Linux    (O) Xterm R6 
		( ) VT400   ( ) VT100+   ( ) SCO
Window &gt; Apprearance
	Font: MesloLGS NF, 11-point
        [X] Allow selection of variable-pith fonts
	Font quality:
		( ) Antialiased     ( ) Non-Antialiased
		(O) ClearType       ( ) Default
Window &gt; Translation
        Remote character set = UTF-8
Window &gt; Colours
	[X] Allow terminal to specify ANSI colours
	[X] Allow terminal to use xterm 256-colour mode
	Indicate bolded text by changing:
		( ) The font   (O) The colour   ( ) Both
	[ ] Attempt to use logical palettes
	[ ] Use system colours
Connection &gt; Data
	Terminal-type string = xterm-256color
</code></pre>
<div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="pi-hole">
</h2><h2 id="pi-holeh2">Pi Hole</h2>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">
<p><a href="
https://github.com/pi-hole/pi-hole">https://github.com/pi-hole/pi-hole</a></p>
<p><img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg"></p><pre class="  language-shell"><code class="prism  language-shell">
curl -sSL https://install.pi-hole.net | bash
&lt;/cod</code></pre><p></p>
<div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="samba">Samh2
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">
https://github.com/samba-team/samba"&gt;https://github.com/samba-team/samba<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre class="  language-shell"><code class="prism  language-shell">
sudo apt-get -y install samba samba-common-bin
cat &lt;&lt;&lt;&lt; EOF | sudo tee -a /etc/samba/smb.conf
[HDD]
comment = Raspberry Pi Hard Drive
path = /media/hdd
read only = no
browsable = yes
EOF
sudo service smbd restart
sudo smbpasswd -a pi
</code></pre></h2><div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
id="telegram"&gt;
<h2 id="telegramh2">Telegram</h2>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/link-external.svg">
<p><a href="https://telegram.me/botfather">
https://telegram.me/botfather</a></p>
<pre><img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/list-ordered.svg">
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
<pre><code>
```
sudo apt-get install -y jq
curl https://api.telegram.org/bot$TELEGRAM_TOKEN/getUpdates | jq .result[0].message.chat.id
</code></pre>```
<div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="tmux">Tmux</h2><img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">
<p><a href="https://github.com/tmux/tmux">https://github.com/tmux/tmux</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/issue-closed.svg">
<p><code>
```sudo apt-get install tmux</code></p><div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="youtube-download">
Youtube Download</h2>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">
<p><a href="https://github.com/rg3/youtube-dl">
https://github.com/rg3/youtube-dl</a></p>
<p><img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg"></p><pre class="  language-shell"><code class="prism  language-shell">
shel
sudo apt-get -y install libavcodec-extra libav-tools
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
echo “&lt;&lt;youtube-dl Playlist Link&gt;” &gt;&gt;" &gt; ~/.youtube-dl
mkdir /medi/hdd/youtube-dl
youtube-dl --output “/media/hdd/youtube-dl/%(title)s.%(ext)s” https://www.youtube.com/playlist?list=cat ~/.youtube-dl
</code>&lt;/pr</pre><p></p>
<div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="youtube-upload">
</h2><h2 id="youtube-uploadh2">Youtube Upload</h2>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/repo.svg">
<p><a href="
https://github.com/tokland/youtube-upload">https://github.com/tokland/youtube-upload</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/alert.svg">
<p><a href="https://github.com/tokland/youtube-upload/pull/264">
https://github.com/tokland/youtube-upload/pull/264</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre class="  language-shell"><code class="prism language- ```shell language-shell">
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
</code></pre>```
<div align="right"><a href="#headless-raspberry-pi-setup">
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="configuration">
</h2><h2 id="configurationimg-alignleft-width20-height20-srchttpsraw.githubusercontent.comprimerocticonsmastericonshome.svg">Configuration<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/home.svg"></h2>
<h4 id="operating-system">
#### Operating System</h4>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre><code>
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
</code></pre>
<p><code>
```sudo raspi-config</code></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre><b>4</b> Localisation Options &gt;  <b>I1</b> Change Locale &gt;&gt; fr_FR.UTF-8 UTF-8
<b>4</b> Localisation Options &gt;&gt;  <b>I2</b> Change Timezone &gt;&gt;  Europe and Time zone : Paris
<b>5</b> Interfacing Options &gt;&gt; <b>P1</b> Camera &gt;&gt; Disable
<b>7</b> Advanced Options &gt;&gt; <b>A1</b> Expand Filesystem
sudo reboot</pre>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/person.svg">
<h4 id="username-and-password">
#### Username and Password</h4>
<p><img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">&lt;presudo passwd root<br>
logout<br>
<i>login as root</i><br>
usermod -l <b>NewUserName</b> pi<br>
usermod -m -d /home/<b>NewUserName</b> <b>NewUserName</b><br>
logout<br>
<i>login as <b>NewUserName</b></i><br>
passwd<br>
sudo apt-get update<br>
sudo passwd -l root<br>
<br>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/key.svg"></p>
<h4 id="key-based-authentication">
#### Key-based authentication</h4> 
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre class="  language-shell"><code class="prism  language-shell">
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
</code></pre>```
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/link-external.svg">
<p><a href="https://www.putty.org/">
https://www.putty.org/</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/device-desktop.svg">
<p><strong>
**puttygen.exe</strong></p>**
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre><code>
```
Conversions &gt;&gt; Import Key &gt;&gt; File &gt;&gt; id_rsa
Save Private Key &gt;&gt; Yes &gt;&gt; File &gt;&gt; id_rsa.ppk
</code></pre>```
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/globe.svg">
<h4 id="domain-name-system">
Domain Name System</h4>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre>sudo apt-get install resolvconf
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
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/broadcast.svg">
<h4 id="disable-bluetooth-and-wifi">
#### Disable Bluetooth and Wifi</h4>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre class="  language-shell"><code class="prism language- ```shell language-shell">
echo "dtoverlay=pi3-disable-wifi" | sudo tee -a /boot/config.txt
echo "dtoverlay=pi3-disable-bt" | sudo tee -a /boot/config.txt
sudo systemctl disable hciuart
sudo reboot
</code></pre>```
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/sync.svg">
<h4 id="remove-swap-file">
#### Remove Swap File</h4>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre><code>
```
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove
sudo systemctl disable dphys-swapfile.service
</code></pre><p>```<br>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/key.svg"></p>
<h4 id="format-usb-key">
#### Format USB key</h4>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/terminal.svg">
<pre>lsblk
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
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>
<h2 id="license">
</h2><h2 id="licenseh2">License</h2>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/info.svg">
<p><a href="https://github.com/primer/octicons">
https://github.com/primer/octicons</a></p>
<img align="left" width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/tasklist.svg">
<pre>MIT License

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
<img width="20" height="20" src="https://raw.githubusercontent.com/primer/octicons/master/icons/chevron-up.svg"></a></div>

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE0NTIxODU4NjhdfQ==
-->