#!/bin/sh


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

Cddf() {

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


Configuration() {
echo "ok"
choice=$(whiptail --menu "" --title "Configuration" $conf \
  "R" "Raspberry Configuration" \
  "M" "Mail Configuration" \
  "C" "Remote Control Configuration" \
  3>&1 1>&2 2>&3)
  clear
  case $choice in
    R) sudo raspi-config ;;
    U) ;;
    C) concordance ;;
  esac
}


Utilities() {
choice=$(whiptail --menu "" --title "Services" $conf \
  "M" "Midnight Commander" \
  "R" "minidlna reload" \
  "U" "minidlna status" \
  "P" "sst play" \
  "O" "sst stop" \
  "A" "transmission Start" \
  "P" "transmission Stop" \
  "Q" "transmission Status" \
  "X" "transmission Status" \
  "m" "Midnight Commander" \
  3>&1 1>&2 2>&3)
  clear
  case $choice in
    M) mc ;;
    R) sudo service minidlna force-reload ;;
    U) sudo service minidlna status ;;
    A) sudo service transmission-daemon start ;;
    P) sudo service transmission-daemon stop ;;
    Q) sudo service transmission-daemon status ;;
    X) ruby xmpp.rb ;;
    R) mplayer http://hi1.streamingsoundtracks.com:8000 ;;
    K) killall mplayer ;;
  esac
echo "Press any key to continue"
read -t 5
}

System() {
 choice=$(whiptail --title "System" --menu "" $conf \
  "U" "Update Raspbian" \
  "R" "Update Raspberry Service" \
  "G" "Update Google Pdf Fusion" \
  "X" "Update ruby xmpp" \
  "R" "Redémarer le Raspberry Pi" \
  "S" "Shutdown" \
  "E" "Exit" \
  "M" "sshfs mount pi@192.168.0.1" \
  "N" "umount ssh" \
  3>&1 1>&2 2>&3)
  clear
  case $choice in
    U) sudo apt-get -y autoremove
       sudo apt-get -y update
       sudo apt-get -y upgrade ;;
    R) wget -O rs https://raw.github.com/ManuCart/Raspberry-Service/master/rs.sh
       exec sh rs ;;
    G) wget -O gdrive.rb https://raw.github.com/ManuCart/gdrive-pdf-fusion/master/gdrive.rb ;;
    X) wget -O xmpp.rb https://raw.github.com/ManuCart/ruby-xmpp/master/xmpp.rb ;;
    R) sudo reboot ;;
    S) sudo halt ;;
    E) exit ;;
    M) sudo sshfs -oIdentityFile=/home/w7/id_rsa pi@192.168.0.1:/media/hdd1 /media/ssh ;;
    N) sudo umount /media/ssh ;;
  esac
}
  
Control() {
  choice=$(whiptail --title "Sessions" --menu "" $conf \
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
choice=$(whiptail --title "Outils" \
--menu "Choisisser un outils à exécuter :" $conf \
"C" "Configuration" \
"d" "Control" \
"S" "System" \
"x" "Utilities" \
"w" "Create Slow Motion Movie" \
"y" "Crop Slow Motion Movie" \
"v" "Cat Videos" \
"r" "Renomme les photos" \
"g" "GoPro copy files" \
"n" "Installe des logiciels sur le serveur" \
"e" "Entrer une nouvelle adresse email" \
"f" "gdrive-pdf-fusion" \
3>&1 1>&2 2>&3)
clear
case $choice in
  m) /usr/bin/mc;;
  C) Configuration; Menu ;;
  S) System ;;
  d) Services;;
  r) Music; Menu;;
  x) Utilities;;
  w) SlowMotion;;
  p) ruby gdrive.rb;;
  y) Resize;;
  g) GoPro;;
  v) CatGo;;
  f) ruby gdrive.rb;;
esac
echo 'fin'
}

Installation () {
choice=$(whiptail --title "Packages" \
--checklist "Cochez les logiciels dont vous souhaitez linstallation." $conf \
"C" "concordance" OFF \
"M" "mc" OFF \
"D" "minidlna" OFF \
"N" "ntfs" OFF \
"T" "transmission-daemon" OFF \
"P" "pdftk" OFF \
"B" "samba" OFF \
"X" "sendxmpp" OFF \
"F" "sshfs" OFF \
"S" "sudo" OFF \
"Y" "youtube-dl" OFF \
3>&1 1>&2 2>&3)
echo $choice
#sudo apt-get -y install $choice
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
#conf="--backtitle Raspberry_Pi $lin $col $men"
conf="$lin $col $men"
echo "Conf: " $conf
Menu
