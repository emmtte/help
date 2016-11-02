Google Photos Scripts
=====================
### Prerequisites for photos-step-1
    - Directory structures : 'YYYY-MM-DD xxxxx xxxxx...'
    - Every photos without EXIF informations need to be in right directory
    - Delete directories who no start with 'YYYY-MM-DD xxxxx xxxxx...'
  + [Photos Step #1](#adafruit-channel)
    - Run script ```photos-step-1```
  + [Photos Step #2](#maker-channel)
    - Verify if starred files are in the good directories
    - Be carefoul this script delete entire exif file before rewriting good date
    - Run script ```photos-step-2``` 
  + [Photos Step #3](#dropbox-uploader)
  + [Photos Step #4](#drive)

Backup Photos
=============
  + [Photos Step #1](#flickr-uploader)
  + [Photos Step #1](#gmusicapi-scripts)
  + [Hue](#hue-cli)
  + [Ifttt](#ifttt)
    - [Adafruit Channel](#adafruit-channel)
    - [Maker Channel](#maker-channel)
  + [Keeweb](#keeweb)

Youtube
=======
    + [Youtube Upload](#flickr-uploader)
        - Copy videos files to ```/media/hdd/youtube-upload```
        - Run script youtube-upload
    + [Youtube Download](#gmusicapi-scripts)
        - Create ```~/.youtube.dl``` file with the id playlist
        - Run script Backup
