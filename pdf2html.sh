#!/bin/bash

CWD=$(pwd)
mkdir -p htmlFiles

for file in $(ls "$CWD/files"); do 
    echo "$file"
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo "$filename"
    exit
done