#!/bin/bash
NORMAL="\033[00m"
GREEN="\033[32;01m"
RED="\033[31;01m"

Check(){
clear
SOURCE="-"
for i in `ls /media`; do
if [ -f /media/$i/.backup ]; then SOURCE=/media/$i; fi
done
if [ $SOURCE = "-" ]; then Popup "Pas de disque USB \n Veuillez brancher un disque dur Usb"; return; fi
echo "${GREEN}Veuillez patienter quelques minutes...${NORMAL}"
x=0
echo "Liste des Fichiers à renommer" > Rename.log
find "$SOURCE/Photos/" -iname "*.jpg" -type f | sort | while read name ; do 
	x=`expr $x + 1`
	cible="`dirname "$name"`/IMG_$(printf "%05d" $x).JPG"
	if [ "$name" = "$cible" ] ; then 
		echo "OK $name ==>> $cible" >> Rename.log;
		else
		echo "ERROR $name ==>> $tmpname" >> Rename.log
		fi
done

echo "rename done!"
echo "Résultats de Rename" | mail -s "Photos Rename" $mailuser < Rename.log
}

C() {

find "/home/manu/Dropbox/TestPhotos/" -iname "*.jpg" -type f | sort | while read name ; do 
	cible="`dirname "$name"`/IMG_$(printf "%05d" $x).JPG"
	if [ "$name" = "$cible" ] ; then 
		echo "SKIP $name ==>> $cible" >> Rename.log;
		else
		tmpname=`dirname "$name"`/IMG_$(printf "%05d" $x).J
		echo "TEMP RENAME $name ==>> $tmpname" >> Rename.log
		
		fi
done
}

list_files() {
 if !(test -d "$1") then echo $1; return; fi

cd "$1"
 echo; echo "Directory Name `pwd`:"; #Display Directory name

 for i in *
 do
 if test -d "$i" #if dictionary
 then 
 list_files "$i" #recursively list files
cd ..
 else
 echo "File name : $i"; #Display File name
fi

 done
}

Convert () {
echo "*********************************************"
DIR="/home/manu/Dropbox/TestPhotos/."

if [ $# -eq 0 ]
then list_files "$DIR"
exit 0
fi

}


Ruby () {
clear
echo "${GREEN}Installation de Ruby${NORMAL}"
sudo apt-get -y install pdftk
wget https://dl.dropbox.com//Jbig2Encode
sudo mv Jbig2Encode /bin/Jbig2Encode
sudo chmod +x /bin/Jbig2Encode
}

Concordance() {
clear
if [ ! -e "/usr/bin/concordance" ]; then Logitech; fi

whiptail --backtitle "Post-Installation Ubuntu" --title "Répertoire temporaire" \
--inputbox "Sauvegarder les fichiers créé par le site dans le répertoire temporaire Dropbox" 18 60 "./Dropbox/Temporary" 2> /tmp/.temporary
temp=`cat /tmp/.temporary`

cat > $temp/Logitech.url << EOF
[InternetShortcut]
URL=http://members.harmonyremote.com/
EOF
whiptail --backtitle "Ubuntools" --title "Attention!" --infobox "Brancher la télécommande Logitech Harmony" 12 60
Popup "Brancher la télécommande Logitech Harmony";
if [ -e "./Connectivity.EZHex" ]; then rm $temp/Connectivity.EZHex; fi
if [ -e "./Update.EZHex" ]; then rm $temp/Update.EZHex; fi
Popup "Attente de la connexion avec le serveur";


while [ ! -e "$temp/Connectivity.EZHex" ] ; do sleep 1; done
concordance -t $temp/Connectivity.EZHex
echo "Serveur connecté...Début de la mise à jour"
while [ ! -e "$temp/Update.EZHex" ] ; do sleep 1; done
concordance -C $temp/Update.EZHex
popup "Update fait! Débrancher la télécommande Logitech Harmony"
}

Rename() {
clear
SOURCE="-"
for i in `ls /media`; do
if [ -f /media/$i/.backup ]; then SOURCE=/media/$i; fi
done
if [ $SOURCE = "-" ]; then Popup "Pas de disque USB \n Veuillez brancher un disque dur Usb"; return; fi
echo "${GREEN}Veuillez patienter quelques minutes...${NORMAL}"
x=0
echo "Liste des Fichiers à renommer" > Rename.log
find "$SOURCE/Photos/" -iname "*.jpg" -type f | sort | while read name ; do 
	x=`expr $x + 1`
	cible="`dirname "$name"`/IMG_$(printf "%05d" $x).JPG"
	if [ "$name" = "$cible" ] ; then 
		echo "SKIP $name ==>> $cible" >> Rename.log;
		else
		tmpname=`dirname "$name"`/IMG_$(printf "%05d" $x).J
		echo "TEMP RENAME $name ==>> $tmpname" >> Rename.log
		mv "$name" "$tmpname"
		fi
done
echo "Veuillez patienter encore quelques minutes..."
find "$SOURCE/Photos/" -iname "*.J" -type f | while read tmpname ; do 
echo RENAME "$tmpname ==>> $tmpname"PG >> Rename.log
mv "$tmpname" "$tmpname"PG
done

echo "rename done!"
#echo "Résultats de Rename" | mail -s "Photos Rename" $mailuser < Rename.log

}


Minidlna(){
choice=$(whiptail --title "minidlna" --menu "Choose an action" $conf \
  "R" "minidlna reload" \
  "U" "minidlna status" \
  3>&1 1>&2 2>&3)
  case $choice in
    R) sudo service minidlna force-reload ;;
    U) sudo service minidlna status ;;
  esac
}

Sst(){
	choice=$(whiptail --title "streaming soundtracks" --menu "Choose an action" $conf \
  "P" "play" \
  "O" "stop" \
  3>&1 1>&2 2>&3)
  clear
  case $choice in
    R) mplayer http://hi1.streamingsoundtracks.com:8000 ;;
    U) killall mplayer ;;
  esac
}

System(){
 choice=$(whiptail --title "System" --menu "Choose an action" $conf \
  "C" "Configuration" \
  "U" "Update Raspbian" \
  "R" "Update Raspberry Service" \
  "G" "Update Google Pdf Fusion" \
  "R" "Redémarer le Raspberry Pi" \
  "S" "Shutdown" \
  "E" "Exit" \
  "M" "sshfs mount pi@192.168.0.1" \
  "N" "umount ssh" \
  3>&1 1>&2 2>&3)
  clear
  case $choice in
    C) sudo raspi-config ;;
    U) sudo apt-get -y autoremove
       sudo apt-get -y update
       sudo apt-get -y upgrade ;;
    R) wget -O rs https://raw.github.com/ManuCart/Raspberry-Service/master/rs.sh
       exec bash rs;;
    G) wget -O gdrive.rb https://raw.github.com/ManuCart/gdrive-pdf-fusion/master/gdrive.rb
    R) sudo reboot ;;
    S) sudo halt ;;
    E) exit ;;
    M) sudo sshfs -oIdentityFile=/home/w7/id_rsa pi@192.168.0.1:/media/hdd1 /media/ssh;;
    N) sudo umount /media/ssh;;
  esac
read -t 10
}
  
Tmux(){
  choice=$(whiptail --title "tmux sessions" --menu "Use Ctrl+b d to detach session" $conf \
  "Y" "Youtube" \
  "M" "Mencoder" \
  "S1" "Attach Session 1" \
  "S2" "Attach Session 2" \
  "S3" "Attach Session 3" \
  "S4" "Attach Session 4" \
  "L" "List Sessions" \
  "N1" "New Session 1" \
  "N2" "New Session 2" \
  "N3" "New Session 3" \
  "N4" "New Session 4" \
  3>&1 1>&2 2>&3)
  clear
  case $choice in
    M) tmux attach-session -t mencoder ;;
    Y) tmux attach-session -t youtube ;;
	S1) tmux attach-session -t session-01;;
	S2) tmux attach-session -t session-02;;
	S3) tmux attach-session -t session-03;;
	S4) tmux attach-session -t session-04;;
	L) tmux list-sessions;;
	N1) tmux new -s session-01;;
	N2) tmux new -s session-02;;
	N3) tmux new -s session-03;;
	N4) tmux new -s session-04;;
  esac
}
  
Transmission(){
 choice=$(whiptail --title "Transmission" --menu "Choose an option" $conf \
  "A" "Start" \
  "P" "Stop" \
  "U" "Status" \
  3>&1 1>&2 2>&3)
  #tput cup 3 30
  clear
  case $choice in
    A) sudo service transmission-daemon start ;;
    P) sudo service transmission-daemon stop ;;
    U) sudo service transmission-daemon status ;;
  esac
read -t 5
}

GoPro(){
sudo mount -t auto UUID=6634-3132 /media/gopro
mkdir /media/hdd1/gopro /media/hdd1/gopro/photos /media/hdd1/gopro/videos 
cp -v /media/gopro/DCIM/???GOPRO/*.JPG /media /media/hdd1/gopro/photos
cp -v /media/gopro/DCIM/???GOPRO/*.MP4 /media /media/hdd1/gopro/videos
}

SlowMotion(){
INIT="/media/hdd1/SlowMotion"
dir=$(whiptail --inputbox "Entrez le chemin des photos" 8 $col $INIT --title "Slow Motion Folder" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
  echo "User selected Ok and entered " $dir
cd $dir

# read the image dimensions image width and height must be multiple of 16
width=2592
height=1458

# compute the optimal bitrate the 50 factor can vary between 40 and 60
obr=$(($width * $height * 60 * 25 / 256))

# set the MPEG4 codec options you have to experiment!
#opt="vbitrate=$obr:mbd=2:keyint=132:v4mv:vqmin=3:lumi_mask=0.07:dark_mask=0.2:scplx_mask=0.1:tcplx_mask=0.1:naq:trell"
#codec="mpeg4"

# set the Microsoft MPEG4 V2 codec options
opt="vbitrate=$obr:mbd=2:keyint=132:vqblur=1.0:cmp=2:subcmp=2:dia=2:mv0:last_pred=3"
codec="msmpeg4v2"

# compress
ls -1 *-CROP.JPG >  files.lst
mencoder -ovc lavc -lavcopts vcodec=$codec:vpass=1:$opt -mf type=jpg:w=$width:h=$height:fps=15 -vf harddup -nosound -o /dev/null mf://@files.lst
mencoder -ovc lavc -lavcopts vcodec=$codec:vpass=2:$opt -mf type=jpg:w=$width:h=$height:fps=15 -vf harddup -nosound -o output.avi mf://@files.lst

# cleanup
rm -f divx2pass.log

google youtube post --category Entertainment --access=unlisted $dir/output.avi
echo "La vidéo est maintenant sur YouTube" | sendxmpp -t `cat ~/.email`
fi
}

Resize(){
INIT="/media/hdd1/SlowMotion"
dir=$(whiptail --inputbox "Entrez le chemin des photos" 8 $col $INIT --title "Slow Motion Folder" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
  cd $dir
  mkdir CROP
  for img in *.JPG; do
    convert "$img" -crop 2592x1456+0+488 "CROP/$img-CROP.JPG" #bottom
	#convert $img -crop 2592x1456+0+0 CROP/$img-CROP.JPG #top
	#convert $img -crop 2592x1456+0+244 CROP/$img-CROP.JPG #middle
  done
  echo "L'ensemble des photos sont en 16:9" | sendxmpp -t `cat ~/.email`
fi
}

CatGo(){
echo "clear" > ~/task.sh
echo "cd /media/hdd1/gopro/videos/" >> ~/task.sh
INIT="/media/hdd1/ConcatVideos"
dir=$(whiptail --inputbox "Entrez le chemin des photos" 8 $col $INIT --title "Concat Videos" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
  mencoder `ls $dir/*.MP4 | sort` -ovc copy -oac pcm -o $dir/video.avi
  google youtube post --category Entertainment --access=unlisted $dir/video.avi
  echo "La vidéo est maintenant sur YouTube" | sendxmpp -t `cat ~/.email`
fi
}

Menu(){
choice=$(whiptail --backtitle "Raspberry Pi" --title "Outils" \
--menu "Choisisser un outils à exécuter :" $conf \
"m" "Midnight Commander" \
"s" "System" \
"d" "Minidlna" \
"r" "Streaming Soundtracks" \
"x" "Tmux sessions" \
"t" "transmission" \
"w" "Create Slow Motion Movie" \
"y" "Crop Slow Motion Movie" \
"v" "Cat Videos" \
"r" "Renomme les photos" \
"p" "Pdf Fusion" \
"g" "GoPro copy files" \
"d" "Programme la télécommande Logitech" \
"n" "Installe des logiciels sur le serveur" \
"e" "Entrer une nouvelle adresse email" \
"f" "gdrive-pdf-fusion" \
3>&1 1>&2 2>&3)

case $choice in

t) Transmission; Menu;;
b) Concordance; Menu;;
m) /usr/bin/mc; Menu;;
s) System; Menu;;
d) Minidlna; Menu;;
r) Sst; Menu;;
x) Tmux; Menu;;
n) Install; Menu;;
w) SlowMotion; Menu;;
p) ruby gdrive.rb; Menu;;
y) Resize; Menu;;
g) GoPro; Menu;;
v) CatGo; Menu;;
f) ruby gdrive.rb;;

esac 
read -t 10
}


Install () {
choice=$(whiptail --backtitle "Raspberry Pi Software Installation" --title "Liste des Utilitaires" \
--checklist "Cochez les logiciels dont vous souhaitez linstallation." $conf \
"s" "sudo" OFF \
"m" "mc" OFF \
"n" "ntfs" OFF \
"f" "sshfs" OFF \
"D" "concordance" OFF \
"r" "minidlna" OFF \
"Y" "youtube-dl" OFF \
"T" "transmission-daemon" OFF \
"S" "sendxmpp" OFF \
"a" "samba" OFF \
3>&1 1>&2 2>&3)
echo $choice
sudo apt-get -y install $choice
}

echo "Le 1er paramètre est : $1"
echo "Le 2ème paramètre est : $2"
echo "Lines: " $LINES
echo "Columns: " $COLUMNS
lin=$(tput lines)
col=$(tput cols)
lin=$((lin - 4))
col=$((col - 5))
men=$((lin - 7))
echo "Lines: " $lin
echo "Columns: " $col
echo "Menu: " $men
conf="$lin $col $men"
echo "Conf: " $conf
Menu
