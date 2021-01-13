#!/bin/bash

CWD=$(pwd)
mkdir -p htmlFiles

for file in $(ls "$CWD/files"); do 
    echo "$file"
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo "$filename"
    if test -f "$CWD/../htmlFiles/$filename.html"; then
        echo "$file exists."
    else
        cp "$SOURCE_DIR/$file" "$CWD/files/$file"
        echo "---->"
        exit
        git add .
        git commit -m "$filename.html"
        git push origin master
    fi
    exit
done