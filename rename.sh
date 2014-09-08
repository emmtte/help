#!/bin/bash
# curl -o ~/rename.sh https://raw.githubusercontent.com/ManuCart/ServicePi/master/rename.sh
# Get a list of all jpeg files files in the current directory.  Assumes extensions of 
# ".jpg" or ".JPG"

# Loop through the list, renaming each to a date/time based name
COUNTER=1
find "$1" -iname "*.jpg" -type f | sort | while read FILE ; do 
        EXIFDATE=`exif $FILE | grep "Date and Time (Origi" | cut -d '|' -f 2 | tr ' ' '_'`
        echo "|$FILE|$EXIFDATE|$(printf '%05d' $COUNTER)|"
        #EXIFDATE=`exif $FILE | grep "Date" | grep -v "(" | cut -d '|' -f 2 | cut -d ' ' -f 1 | tr ':' '-'`
	#EXIFTIME=`exif $FILE | grep "Date" | grep -v "(" | cut -d '|' -f 2 | cut -d ' ' -f 2 | tr ':' '.'`
	#NAME="$EXIFDATE $EXIFTIME $COUNTER"
	NEWFILE="$EXIFDATE_$(printf '%05d' $COUNTER).JPG"
	echo ""
	mv -u "$FILE" "`dirname "$FILE"`"/"$NEWFILE"
	COUNTER=$((COUNTER + 1))
done
exit

# Set up a counter for the file names
COUNTER=1
# Loop through list2, renaming as "pic###.jpg"
find "$1" -iname "*.jpg" -type f | sort | while read FILE ; do 
        NEWNAME="IMG_$(printf "%05d" $COUNTER).JPG"
        mv "$FILE" "`dirname "$FILE"`"/"$NEWNAME"
        # Increment COUNTER
        COUNTER=$((COUNTER + 1))
done
