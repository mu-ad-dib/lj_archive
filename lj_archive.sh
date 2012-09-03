#!/bin/bash

# Assumes that you have used ljdump-1.5.1 to download entries from LiveJournal, and are in the ljdump directory
# e.g. I ran ljdump.py for user 'bartelby', and am in ~/ljdump-1.5.1
# The script will make the directory ~/ljdump-1.5.1/bartelby/Entries, and extract each entry's date/time, title, and main content into a .txt file 

echo -e "Enter your LiveJournal username: \c "
read USERNAME

JOURNAL_DIR="./$USERNAME"
cd "$JOURNAL_DIR"
echo "Copying entries to $JOURNAL_DIR/Entries..."
mkdir "./Entries" > /dev/null 2>&1

# Get only values for each "L-" (content) entry - regexes kept for reference 
FILES="[L]-*"
#	ENTRY_TIME_FULL=$(cat $file | grep '</eventtime>' | sed -e 's/[[:punct:]]*eventtime[[:punct:]]//g')
# Pulls the content between <event>...</event>, strips out '<event>' and '</event>'
#	ENTRY_CONTENT=$(cat $file | grep '</event>' | sed -e 's/[[:punct:]]*event[[:punct:]]//g')

for file in $FILES
do
#	echo $file 
# Strip out all non-numeric characters, convert <space> to '-' (e.g. 2003-01-09 11:53:00 to 2003_01_09-115300)
	ENTRY_DATE=$(cat $file | grep '</eventtime>' | sed -e 's/[[:punct:]]*eventtime[[:punct:]]//g' | sed -e 's/[^0-9\ ]//g' | sed -e 's/[ ]/-/g')
	cat $file | grep '</eventtime>' | sed -e 's/[[:punct:]]*eventtime[[:punct:]]//g' > "./Entries/$ENTRY_DATE.txt"
	cat $file | grep '</subject>' | sed -e 's/[[:punct:]]*subject[[:punct:]]//g' >> "./Entries/$ENTRY_DATE.txt" 
	cat $file | grep -e '<*event>' | sed -e 's/[[:punct:]]*event[[:punct:]]//g' >> "./Entries/$ENTRY_DATE.txt"
done
