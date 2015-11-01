Third-Party Command Line Tools
==============================
### Castnow
https://github.com/xat/castnow
````
sudo apt-get install -y nodejs npm
sudo npm install castnow -g
````
### Dropbox-Uploader
https://github.com/andreafabrizi/Dropbox-Uploader
````
sudo curl -o /usr/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/bin/dropbox_uploader
dropbox_uploader
````
### Drive
https://github.com/odeke-em/drive
````
sudo apt-get install golang
cat << ! >> ~/.bashrc
export GOPATH=/usr/local/go
export PATH=\$GOPATH:\$GOPATH/bin:\$PATH
!
source ~/.bashrc
sudo mkdir /usr/local/go
sudo chmod ugo+rwx /usr/local/go
sudo go get -u github.com/odeke-em/drive/cmd/drive
drive init ~/gdrive
````
### Flickr Smart Sync
https://github.com/faisalraja/flickrsmartsync
````
sudo apt-get install python-dev python-setuptools
git clone https://github.com/faisalraja/flickrsmartsync.git
cd flickrsmartsync
sudo python setup.py install
sudo rm -r /home/pi/flickrsmartsync
flickrsmartsync --sync-path /media/hdd/photos
````
### Flickr-Uploader
https://github.com/trickortweak/flickr-uploader
````
git clone https://github.com/trickortweak/flickr-uploader.git
chmod +x ~/flickr-uploader/uploadr.py
mcedit ~/flickr-uploader/uploadr.ini
~/flickr-uploader/uploadr.py
````
### Google CL
https://github.com/vinitkumar/googlecl
````
git clone https://github.com/vinitkumar/googlecl.git
cd googlecl
sudo python setup.py install
````
### Hangouts Bot
https://github.com/hangoutsbot/hangoutsbot
````
git clone https://github.com/xmikos/hangupsbot.git
cd hangupsbot
sudo python3 setup.py install
python3 hangupsbot/hangupsbot.py
````
### Mercury
https://github.com/Skarafaz/mercury
````
{
    "name" : "Raspberry Pi",
    "host" : "192.168.0.1",
    "port" : 22,
    "user" : "pi",
    "password" : "raspberry",
    "commands" : [ {
        "name" : "motion start",
        "sudo" : false,
        "cmd" : "motion"
    }, {
       "name" : "motion stop",
        "sudo" : true,
        "cmd" : "killall motion"
    }, {
        "name" : "transmission start",
        "sudo" : true,
        "cmd" : "service transmission-daemon start"
    }, {
       "name" : "transmission stop",
        "sudo" : true,
        "cmd" : "service transmission-daemon stop"
    }, {
        "name" : "Rsync music",
        "sudo" : true,
        "cmd" : "rsync -a --delete --exclude '.@__qini' --chown=root:root --chmod=D775,F664 /mnt/nas/music/ /var/data/music/"
    } ]
}
````

### Picasa Web Sync
https://github.com/leocrawford/picasawebsync
`````
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
`````
### Picasa Web Uploader
https://github.com/jackpal/picasawebuploader
`````
sudo apt-get install python-pip
sudo apt-get install libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev
sudo pip install pil
sudo pip install gdata
sudo apt-get install python-pyexiv2
curl -o picasawebuploader.py https://raw.githubusercontent.com/jackpal/picasawebuploader/master/main.py
sudo chmod +x picasawebuploader.py 
picasawebuploader.py --email @gmail.com --source /media/hdd/photos
`````
### Pi Hole
https://github.com/jacobsalmela/pi-hole
````
curl -s "https://raw.githubusercontent.com/jacobsalmela/pi-hole/master/automated%20install/basic-install.sh" | bash
sudo mcedit /etc/dnsmasq.conf
> change 
server=208.67.222.222
server=208.67.220.220
````
### Pushbullet
https://github.com/Red5d/pushbullet-bash
````
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/pushbullet -o /usr/bin/pushbullet
sudo chmod a+x /usr/bin/pushbullet
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/JSON.sh -o /usr/bin/JSON.sh
sudo chmod a+x /usr/bin/JSON.sh
echo "PB_API_KEY=ABCDEFGHIJKLMNOPQRSTUVWXYZ" > ~/.config/pushbullet
````
### Rclone
https://github.com/ncw/rclone
````
sudo apt-get install -y golang
echo 'PATH=$PATH:/usr/local/go/bin'|sudo tee -a /etc/profile.d/golang.sh
source /etc/profile.d/golang.sh
curl -o rclone.zip http://downloads.rclone.org/rclone-v1.23-linux-arm.zip
unzip rclone.zip
sudo cp rclone-v1.23-linux-arm/rclone /usr/bin/rclone
rclone config
mv .rclone.conf /home/pi/.config/rclone.conf
````
### Sejda
https://github.com/torakiki/sejda
````
sudo apt-get install oracle-java8-jdk
curl -L -o sejda.zip https://github.com/torakiki/sejda/releases/download/v1.0.0.RELEASE/sejda-console-1.0.0.RELEASE-bin.zip
unzip sejda.zip
sudo mkdir /usr/local/sejda
sudo chmod ugo+rwx /usr/local/sejda
mv /home/pi/sejda-console-1.0.0.RELEASE /usr/local/sejda
rm sejda.zip
/usr/local/sejda/bin/sejda-console
````
### Youtube-dl
https://github.com/rg3/youtube-dl
````
sudo curl https://yt-dl.org/latest/youtube-dl -o /usr/bin/youtube-dl
sudo chmod a+x /usr/bin/youtube-dl
````
### Youtube-Upload
https://github.com/tokland/youtube-upload
````
sudo easy_install --upgrade google-api-python-client
wget https://github.com/tokland/youtube-upload/archive/master.zip
unzip master.zip
cd youtube-upload-master
sudo python setup.py install
````
````
mv youtube.json /home/pi/.config/youtube.json
youtube-upload --title="test" --category="Music" --privacy="private" --location="=" --client-secrets="/home/pi/.config/youtube.json" "/media/hdd/gopro/videos/youtube.avi"
````
