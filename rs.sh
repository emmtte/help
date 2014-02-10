#!/usr/bin/env bash

Configuration() {
echo "ok"
choice=$(whiptail --menu "" --title "Configuration" $conf \
  "R" "Raspberry Configuration" \
  "M" "Mail Configuration" \
  "C" "Remote Control Configuration" \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
  clear
  case $choice in
    R) sudo raspi-config ;;
    U) ;;
    C) concordance ;;
  esac
  echo "Press any key to continue"
  read -t 5
  Configuration
  fi
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
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
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
  echo "Press any key to continue"
  read -t 5
  Control
  fi
}

System() {
 choice=$(whiptail --title "System" --menu "" $conf \
  "U" "Update Raspbian" \
  "R" "Update Raspberry Service" \
  "G" "Update Google Pdf Fusion" \
  "P" "Update GoPro Script" \
  "X" "Update ruby xmpp" \
  "R" "Redémarer le Raspberry Pi" \
  "S" "Shutdown" \
  "E" "Exit" \
  "M" "sshfs mount pi@192.168.0.1" \
  "N" "umount ssh" \
  3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
  clear
  case $choice in
    U) sudo apt-get -y autoremove
       sudo apt-get update
       sudo apt-get -y upgrade
       sudo apt-get -y dist-upgrade
    R) wget -O rs https://raw.github.com/ManuCart/Raspberry-Service/master/rs.sh
       exec bash rs ;;
    G) wget -O gdrive https://raw.github.com/ManuCart/gdrive-pdf-fusion/master/gdrive.rb ;;
    P) wget -O gopro https://raw.github.com/ManuCart/GPtoYT/master/gopro.sh;;
    X) wget -O xmpp.rb https://raw.github.com/ManuCart/ruby-xmpp/master/xmpp.rb ;;
    R) sudo reboot ;;
    S) sudo halt ;;
    E) exit ;;
    M) sudo sshfs -oIdentityFile=/home/w7/id_rsa pi@192.168.0.1:/media/hdd1 /media/ssh ;;
    N) sudo umount /media/ssh ;;
  esac
  echo "Press any key to continue"
  read -t 5
  System
  fi
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
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
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
  Utilities
  fi
}
  
Menu(){
choice=$(whiptail --title "Outils" \
--menu "Choisisser un outils à exécuter :" $conf \
"C" "Configuration" \
"L" "Control" \
"S" "System" \
"U" "Utilities" \
"w" "Create Slow Motion Movie" \
"y" "Crop Slow Motion Movie" \
"v" "Cat Videos" \
"r" "Renomme les photos" \
"g" "GoPro copy files" \
"n" "Installe des logiciels sur le serveur" \
"e" "Entrer une nouvelle adresse email" \
"f" "gdrive-pdf-fusion" \
3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
clear
case $choice in
  C) Configuration;;
  L) Control;;
  S) System ;;
  U) Utilities;;
  d) Services;;
  w) SlowMotion;;
  p) ruby gdrive.rb;;
  y) Resize;;
  g) GoPro;;
  v) CatGo;;
  f) gdrive;;
esac
Menu
fi
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
