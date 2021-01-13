#!/bin/bash

CWD=$(pwd)
mkdir -p htmlFiles

for file in $(ls "$CWD/files"); do 
    echo "$file"
    exit
done