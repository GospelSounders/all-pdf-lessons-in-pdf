#!/bin/bash

SOURCE_DIR="/media/brian/Store/Gospel Sounders/Periodicals/SSQ"

# ls "$SOURCE_DIR" |grep '.pdf'
# exit
CWD=$(pwd)
mkdir -p files

for file in $(ls "$SOURCE_DIR" |grep '.pdf'); do 
# for file in $(ls "$SOURCE_DIR/"*.pdf); do 
    echo "$file"
    # FILE=$(basename "$file")
    # echo "$FILE"
    # echo "$CWD/$file"
    if test -f "$CWD/files/$file"; then
        echo "$file exists."
    else
        cp "$SOURCE_DIR/$file" "$CWD/files/$file"
        git add .
        git commit -m "$file"
        git push origin master
    fi
    # firstFileName=$file
    # [[ "$index" -eq "$fileNum" ]] && break;
    # let index++
done