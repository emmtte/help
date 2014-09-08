#!/bin/bash
# curl -o ~/rename.sh https://raw.githubusercontent.com/ManuCart/ServicePi/master/rename.sh
# Get a list of all jpeg files files in the current directory.  Assumes extensions of 
# ".jpg" or ".JPG"
LIST1=`ls -R *.jpg *.JPG`

# Loop through the list, renaming each to a date/time based name
COUNTER=1
for CURFILE in $LIST1; do
        EXIFDATE=`exif $CURFILE | grep "Date" | grep -v "(" | cut -d '|' -f 2 | tr ' ' '_'`
        #EXIFDATE=`exif $FILE | grep "Date" | grep -v "(" | cut -d '|' -f 2 | cut -d ' ' -f 1 | tr ':' '-'`
		#EXIFTIME=`exif $FILE | grep "Date" | grep -v "(" | cut -d '|' -f 2 | cut -d ' ' -f 2 | tr ':' '.'`
		#NAME="$EXIFDATE $EXIFTIME $COUNTER"
		NAME = "$EXIFDATE_$COUNTER"
		mv -u $CURFILE $NAME.JPG
		COUNTER=$((COUNTER + 1))
done

# Get the list of files, which by default will be in sorted order
LIST2=`ls -R *.JPG`

# Set up a counter for the file names
COUNTER=1

# Loop through list2, renaming as "pic###.jpg"
for CURFILE in $LIST2; do
        NEWNAME="IMG_$(printf "%05d" $COUNTER).JPG"
        mv $CURFILE $NEWNAME
        # Increment COUNTER
        COUNTER=$((COUNTER + 1))
done
