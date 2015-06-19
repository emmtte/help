Third-Party Command Line Utilities
==================================
### Dropbox-Uploader
https://github.com/andreafabrizi/Dropbox-Uploader
````
sudo curl -o /usr/bin/dropbox_uploader \
https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
sudo chmod +x /usr/bin/dropbox_uploader
dropbox_uploader
````
### Flickr Smart Sync
https://github.com/faisalraja/flickrsmartsync
````
sudo apt-get install python-dev python-setuptools
git clone https://github.com/faisalraja/flickrsmartsync.git
cd flickrsmartsync
sudo python setup.py install
sudo rm /home/pi/flickrsmartsync
flickrsmartsync --sync-path /media/hdd/photos
````
### Google CL
https://github.com/vinitkumar/googlecl
````
git clone https://github.com/vinitkumar/googlecl.git
cd googlecl
sudo python setup.py install
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
cd picasawebsync
sudo python setup.py install
sudo rm -r /home/pi/picasawebsync
picasawebsync.py -d /media/hdd/photos --shrink
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
### Pushbullet
https://github.com/Red5d/pushbullet-bash
````
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/pushbullet -o /usr/bin/pushbullet
sudo chmod a+x /usr/bin/pushbullet
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/JSON.sh -o /usr/bin/JSON.sh
sudo chmod a+x /usr/bin/JSON.sh
echo "API_KEY=ABCDEFGHIJKLMNOPQRSTUVWXYZ" > ~/.config/pushbullet
````
### Rclone
https://github.com/ncw/rclone
````
curl -o rclone.zip http://downloads.rclone.org/rclone-v1.12-linux-arm.zip
unzip rclone.zip
sudo cp rclone-v1.12-linux-arm/rclone /usr/bin/rclone
rclone config
mv .rclone.conf /home/pi/.config/rclone.conf
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
