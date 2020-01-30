#!/bin/bash

# detach tmux
# crontab -e -u dev
# >>> @reboot /bin/sleep 60 && /home/dev/rpi/start.sh
# tmux attach 
# >>> @reboot /bin/sleep 30 && /home/dev/rpi/start.sh

tmux has-session -t pi

if [ "$?" -eq 1 ] ; then

  sudo /etc/init.d/ntp stop
  sudo ntpd -q -g
  sudo /etc/init.d/ntp start

  mkdir -p ~/.config/mc
  
  ln -sf ~/rpi/mc.menu ~/.config/mc/menu
  ln -sf ~/rpi/tmux.conf ~/.tmux.conf

  tmux -u new-session -d -s pi

  tmux rename-window -t pi:1 1
  tmux send "SHELL='/bin/bash' && mc /usr/bin/mc -x" ENTER

  tmux new-window -n 2
  tmux send "SHELL='/bin/bash' && /usr/bin/mc -x" ENTER

  tmux new-window -n 3
  tmux send "SHELL='/bin/bash' && /usr/bin/mc -x" ENTER

  tmux new-window -n 4
  tmux send "SHELL='/bin/bash' && /usr/bin/mc -x" ENTER

  tmux new-window -n 5
  tmux send "SHELL='/bin/bash' && /usr/bin/mc -x" ENTER

  tmux new-window -n 6
  tmux send "SHELL='/bin/bash' && /usr/bin/mc -x" ENTER

  tmux new-window -n IGB
  tmux send "SHELL='/bin/bash' && cd ~/igb5 && node igb" ENTER

  tmux new-window -n INFOS
  tmux send "SHELL='/bin/bash' && cd ~/inf && node inf" ENTER

fi

tmux attach -t pi
