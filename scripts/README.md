Google Photos Scripts
=====================

  + [Photos Step #1](photos-step-1)
    - Delete ```/media/hdd/Drive/Google Photos``` directory
    - Delete directories who no start with 'YYYY-MM-DD xxxxx xxxxx...'
    - Directory structures shall be : 'YYYY-MM-DD xxxxx xxxxx...'
    - Every photos without EXIF informations need to be in right directory
    - Run script [```photos-step-1```](photos-step-1)
    - :heavy_exclamation_mark: a Google Photos backup should be in ```/media/hdd/backup```
  + [Photos Step #2](photos-step-2)
    - Verify if starred files are in the good directories
    - Be carefoul this script delete entire exif file before rewriting good date
    - Run script [```photos-step-2```](photos-step-2)

Backup Photos
=============

  

Youtube
=======

   + [Youtube Upload](youtube-upload)
    - Copy videos files to ```/media/hdd/youtube-upload```
    - Run script [```youtube-upload```](youtube-upload)
   + [Youtube Download](youtube-backup)
    - Create ```~/.youtube.dl``` file with the id playlist
    - Run script [```youtube-backup```](youtube-upload)
