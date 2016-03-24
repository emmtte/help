if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -z "$TMUX" ]; then
    mc /home/pi/scripts/ /media/hdd/Drive/
fi
