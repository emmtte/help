#!/bin/bash
# curl -o ~/rename.sh https://raw.githubusercontent.com/ManuCart/ServicePi/master/rename.sh
# Get a list of all jpeg files files in the current directory.  Assumes extensions of 
# ".jpg" or ".JPG"

# Loop through files, renaming each to a date/time/number based name
COUNTER=1
find "$1" -iname "*.jpg" -type f | sort | while read FILE ; do 
        EXIF=`exif "$FILE" | grep "Date and Time (Origi" | cut -d '|' -f 2 | tr ' ' '_'`
        NEWFILE="$EXIF_$(printf '%05d' $COUNTER).JPG"
	echo "`basename "$FILE"`=>$NEWFILE"
	mv -u "$FILE" "`dirname "$FILE"`/$NEWFILE"
	COUNTER=$((COUNTER + 1))
done

# Loop again through files, renaming as "IMG_#####.JPG"
COUNTER=1
find "$1" -iname "*.jpg" -type f | sort | while read FILE ; do 
        NEWNAME="IMG_$(printf "%05d" $COUNTER).JPG"
        mv "$FILE" "`dirname "$FILE"`/$NEWNAME"
        COUNTER=$((COUNTER + 1))
done
