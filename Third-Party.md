Third-Party Command Line Tools
==============================
  * [Castnow](#castnow)
  * [Dropbox-Uploader](#dropbox-uploader)
  * [Drive](#drive)
  * [<s>Flickr Smart Sync</s>](#flickr-smart-sync)
  * [Flickr-Uploader](#flickr-uploader)
  * [<s>Google CL</s>](#google-cl)
  * [Hangups](#hangups)
  * [<s>Hangouts Bot</s>](#hangouts-bot)
  * [Ifttt Maker Channel](#ifttt-maker-channel)
  * [Picasa Web Sync](#picasa-web-sync)
  * [Picasa Web Uploader](#picasa-web-uploader)
  * [Pi Hole](#pi-hole)
  * [Pushbullet](#pushbullet)
  * [Rclone](#rclone)
  * [Sejda](#sejda)
  * [Torrent](#torrent)
  * [Youtube-dl](#youtube-dl)
  * [Youtube-Upload](#youtube-upload)

| ------------- | -----:|
| ####Castnow      | :arrow_up: |
Castnow 
-------
[:arrow_up:](up) https://github.com/xat/castnow
```shell
sudo apt-get install -y nodejs npm
sudo npm install castnow -g
nodejs /usr/local/bin/castnow "http://hi.streamingsoundtracks.com" --type "audio/wav"
```

Dropbox-Uploader 
----------------
[:arrow_up:](up) https://github.com/andreafabrizi/Dropbox-Uploader
```shell
sudo curl -o /usr/local/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/local/bin/dropbox_uploader
dropbox_uploader init
```

Drive 
-----
[:arrow_up:](up) https://github.com/odeke-em/drive
```shell
sudo apt-get install golang
cat << ! >> ~/.bashrc
export GOPATH=~/.bin/go
export PATH=\$GOPATH:\$GOPATH/bin:\$PATH
!
source ~/.bashrc
mkdir ~/.bin/go
go get -u github.com/odeke-em/drive/cmd/drive
drive init ~/gdrive
```

<s>Flickr Smart Sync</s> [:arrow_up:](up)
------------------------
https://github.com/faisalraja/flickrsmartsync
```shell
sudo apt-get install python-dev python-setuptools
git clone https://github.com/faisalraja/flickrsmartsync.git
cd flickrsmartsync
sudo python setup.py install
sudo rm -r /home/pi/flickrsmartsync
flickrsmartsync --sync-path /media/hdd/photos
```

Flickr-Uploader
---------------
https://github.com/trickortweak/flickr-uploader
> Do first time without tmux script for token

```shell
sudo apt-get remove elinks links links2 lynx w3m
cd ~/.bin
git clone https://github.com/trickortweak/flickr-uploader.git
chmod +x flickr-uploader/uploadr.py
mcedit flickr-uploader/uploadr.ini
 > FILES_DIR = "/media/hdd/photos"
 > "api_key" : "********************************",
 > "secret"  : "****************"
mv flickr-uploader/ flickr-uploader#1/
cd ~
~/.bin/flickr-uploader#1/uploadr.py
```

<s>Google CL</s>
----------------
https://github.com/vinitkumar/googlecl
```shell
cd bin
git clone https://github.com/vinitkumar/googlecl.git
cd googlecl
sudo python setup.py install
```

Hangups
-------
https://github.com/tdryer/hangups
```shell
git clone https://github.com/tdryer/hangups.git
cd hangups
sudo python3 setup.py install
rm hangups
hangups
```

<s>Hangouts Bot</s>
-------------------
https://github.com/hangoutsbot/hangoutsbot
```shell
git clone https://github.com/hangoutsbot/hangoutsbot.git
cd hangoutsbot
sudo pip3 install -r requirements.txt

python3 ~/.bin/hangoutsbot/hangupsbot/hangupsbot.py
```

Ifttt Maker Channel
-------------------
https://ifttt.com/maker
````
echo "{key}" > ~/.maker_channel_key
curl -X POST https://maker.ifttt.com/trigger/Raspberry_Pi/with/key/`cat ~/.maker_channel_key`
curl -X POST -H "Content-Type: application/json" -d '{"value1":"1","value2":"2","value3":"3"}' https://maker.ifttt.com/trigger/Raspberry_Pi/with/key/`cat ~/.maker_channel_key`
````

Picasa Web Sync
---------------
https://github.com/leocrawford/picasawebsync
```shell
sudo apt-get install jhead
sudo apt-get install python-imaging python-imaging-tk
sudo apt-get install python-gdata
sudo apt-get install python-pip
sudo pip install --upgrade pip 
sudo pip install --upgrade oauth2client
git clone https://github.com/leocrawford/picasawebsync.git
cp /home/pi/client_secrets.json /home/pi/picasawebsync/client_secrets.json
/home/pi/picasawebsync/picasawebsync.py -d /media/hdd/photos
/home/pi/picasawebsync/picasawebsync.py -d /media/hdd/photos --purge
```

<s>Picasa Web Uploader</s>
--------------------------
https://github.com/jackpal/picasawebuploader
```shell
sudo apt-get install python-pip
sudo apt-get install libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev
sudo pip install pil
sudo pip install gdata
sudo apt-get install python-pyexiv2
curl -o picasawebuploader.py https://raw.githubusercontent.com/jackpal/picasawebuploader/master/main.py
sudo chmod +x picasawebuploader.py 
picasawebuploader.py --email @gmail.com --source /media/hdd/photos
```

Pi Hole
-------
https://github.com/jacobsalmela/pi-hole
```shell
curl -L install.pi-hole.net | bash
sudo mcedit /etc/dnsmasq.conf
> change 
server=208.67.222.222
server=208.67.220.220
```

Pushbullet
----------
https://github.com/Red5d/pushbullet-bash
```shell
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/pushbullet -o /usr/local/bin/pushbullet
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/JSON.sh -o /usr/local/bin/JSON.sh
sudo chmod +x /usr/local/bin/pushbullet /usr/local/bin/JSON.sh
```
https://www.pushbullet.com/account
```shell
echo "PB_API_KEY=ABCDEFGHIJKLMNOPQRSTUVWXYZ" > ~/.config/pushbullet
```

Rclone
------
https://github.com/ncw/rclone
```shell
sudo apt-get install -y golang
echo 'PATH=$PATH:/usr/local/go/bin'|sudo tee -a /etc/profile.d/golang.sh
source /etc/profile.d/golang.sh
curl -o rclone.zip http://downloads.rclone.org/rclone-v1.23-linux-arm.zip
unzip rclone.zip
sudo cp rclone-v1.23-linux-arm/rclone /usr/local/bin/rclone
rclone config
mv .rclone.conf /home/pi/.config/rclone.conf
```

Sejda
-----
https://github.com/torakiki/sejda
```shell
sudo apt-get install oracle-java8-jdk
curl -L -o sejda.zip https://github.com/torakiki/sejda/releases/download/v1.0.0.RELEASE/sejda-console-1.0.0.RELEASE-bin.zip
unzip sejda.zip
mkdir ~/.bin/sejda
mv sejda-console-1.0.0.RELEASE/* ~/.bin/sejda
rm sejda.zip
chmod +x ~/.bin/sejda/bin/sejda-console
```

Torrent
-------
https://github.com/maxogden/torrent
```shell
sudo npm install torrent -g
```

Wego
----
https://github.com/schachmat/wego
```shell
go get github.com/schachmat/wego
```
https://developer.worldweatheronline.com/auth/register
````
mcedit ~/.wegorc
````

Youtube-dl
----------
https://github.com/rg3/youtube-dl
```shell
sudo curl https://yt-dl.org/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
echo "<youtube-dl Playlist Link>" > ~/.youtube-dl
youtube-dl --output "/media/hdd/youtube-dl/%(title)s.%(ext)s" https://www.youtube.com/playlist?list=`cat ~/.youtube-dl`
```

Youtube-Upload
--------------
https://github.com/tokland/youtube-upload
```shell
sudo pip install --upgrade google-api-python-client progressbar
wget https://github.com/tokland/youtube-upload/archive/master.zip
unzip master.zip
cd youtube-upload-master
sudo python setup.py install
```
https://developers.google.com/youtube/registering_an_application
```shell
dropbox_uploader download client_secret_youtube.json
sudo mv client_secret_youtube.json /usr/local/share/youtube_upload/client_secrets.json
dropbox_uploader download SampleVideo.mp4
youtube-upload --title="test" --category="Music" --privacy="private" SampleVideo.mp4
```
