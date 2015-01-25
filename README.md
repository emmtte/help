Raspberry-Service
=================

### Prerequisites
````
sudo apt-get install tmux exif mencoder
mkdir /home/pi/service/
cd /home/pi/service/
touch 3rd_party backup system tmux update
````
#### Midnight commander
````
sudo apt-get remove mc
sudo apt-get install libglib2.0-dev libslang2-dev
wget http://ftp.midnight-commander.org/mc-4.8.13.tar.bz2
bzip2 -cd mc-4.8.13.tar.bz2 | tar xvf -
cd mc-4.8.13
./configure
make
sudo make install

echo "export EDITOR=/usr/local/bin/mcedit" >> ~/.profile
````
#### Menu
````
curl -o ~/.config/mc/menu https://raw.githubusercontent.com/ManuCart/ServicePi/master/menu
alias mc='mc /home/pi/service'
echo "alias mc='mc /home/pi/service'" >> ~/.profile
source ~/.profile
````
Third-Party Command Line Utilities
==================================
#### Google CL
https://github.com/vinitkumar/googlecl
````
git clone https://github.com/vinitkumar/googlecl.git
cd googlecl
sudo python setup.py install
````
#### Pushbullet
https://github.com/Red5d/pushbullet-bash
````
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/pushbullet -o /usr/bin/pushbullet
sudo chmod a+x /usr/bin/pushbullet
sudo curl https://raw.githubusercontent.com/Red5d/pushbullet-bash/master/JSON.sh -o /usr/bin/JSON.sh
sudo chmod a+x /usr/bin/JSON.sh
echo "API_KEY=ABCDEFGHIJKLMNOPQRSTUVWXYZ" > ~/.config/pushbullet
````
https://www.pushbullet.com/account
#### Rclone
https://github.com/ncw/rclone
````
curl -o rclone.zip http://downloads.rclone.org/rclone-v1.07-linux-arm.zip
unzip rclone.zip
sudo cp rclone-v1.05-linux-arm/rclone /usr/bin/rclone
rclone config
rclone sync gdrive:/Photos_Old pi:/media/hdd/rclone
````
#### Youtube-dl
https://github.com/rg3/youtube-dl
````
sudo curl https://yt-dl.org/latest/youtube-dl -o /usr/bin/youtube-dl
sudo chmod a+x /usr/bin/youtube-dl
````
#### Youtube-Upload
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


