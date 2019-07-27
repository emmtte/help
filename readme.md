
# PERSONAL USER MENU

[![](https://img.shields.io/badge/rpi-raspberry_pi-c51a4a.svg?style=for-the-badge)](https://www.raspberrypi.org/downloads/raspbian/)
[![](https://img.shields.io/badge/mc-midnight_commander-blue.svg?style=for-the-badge)](https://github.com/MidnightCommander/mc)
[![](https://img.shields.io/badge/tm-tmux-green.svg?style=for-the-badge)](https://github.com/tmux/tmux)

### Installation

```bash
sudo apt-get update
sudo apt-get install exiv2 git mc rsync sshpass tmux
sudo ln -sf bash /bin/sh
git clone https://github.com/ManuCart/Raspberry-Pi.git ~/rpi
cd rpi
sh rescue
```


## .profile
```bash
if [ -z "$TMUX" ]; then
/bin/sh ~/rpi/rescue
fi
```


### Configuration

```bash
Options ─> Configuration
┌ Other options ──────────┐
│ [x] Use internal edit   │
│ [x] Use internal view   │
```

[![](https://img.shields.io/badge/(c)_2014--2018-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

