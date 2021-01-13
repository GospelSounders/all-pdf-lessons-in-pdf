#!/bin/bash

# pdf to text. Files have different layout so edit this accordingly
# for file in $(ls | grep "\.pdf" |head -n 1); do echo  "$file" ; done
# for file in $(find ./ | grep ".pdf" | head -n 1); do pdftotext  "$file" >> "working-2020/$file.md" ; done
# trap - PIPE
# for file in $(ls *.pdf | head -1); do echo "$file.md" ; done


# firstFileName=$(ls *.pdf | head -n 1)
fileNum=${1:-0}
index=0
for file in $(ls *.pdf); do 
    firstFileName=$file
    [[ "$index" -eq "$fileNum" ]] && break;
    let index++
done
file=$firstFileName
cp "$file" "working-2020/"
cd "working-2020/"

pwd
pdfseparate -f 0 -l 1000 "$file" $"file-%d.pdf"
rm $file

echo "" > "$firstFileName.md"
for file in $(ls *.pdf); do 
    pdftotext  "$file" "tmp.md"
    cat tmp.md >> "$firstFileName.md"
    echo $file
    # rm $file
done

rm tmp.md

# echo $fileNum
# echo $index
# echo $firstFileName


# echo $file
# pdftotext  -nopgbrk -fixed 0 "$file" "working-2020/$file-nopgbrk.md"
# ebook-convert "$file" "working-2020/$file-nopgbrk-1.md"

# for file in *.pdf; do pdftotext -layout  "$file" >> "layoutTexts/$file.txt"; done


# for file in *.pdf | head -n 1; do pdftotext  "txts/$file"; done
# for file in *.pdf | head -n 1; do echo $i; done
# for file in *.txt; do cat  "$file" >> "AllLessons"; done
# for file in *.pdf; do pdftotext -layout  "$file" >> "layoutTexts/$file.txt"; done

# // misplaced colons and question marks...
# find ./ -type f -exec sed -i "s|: |:|ig" {} \;
# find ./ -type f -exec sed -i "s| :|:|ig" {} \;

# # rename
# find ./ -type f -name 'file*' -exec mv {} {}.md \;

# # remove empty lines 
# sed '/^[[:space:]]*$/d'

# # join lines broken at wrong places on questions or paragraphs
# find ./ -type f -exec sed -i ':begin;$!N;s/\n\([a-z][a-z]*[ \?]\)/ \1/;tbegin;P;D' {} \;

# # verse on wrong line - Verse 10
# find ./ -type f -exec sed -i ':begin;$!N;s/\n\([Vv]erse[s]*\)/ \1/;tbegin;P;D' {} \;

# # Son?
# find ./ -type f -exec sed -i ':begin;$!N;s/\n\([a-zA-Z][a-z]*[ \?]\)/ \1/;tbegin;P;D' {} \;

# # verse on wrong line -> Heb. r:1
# find ./ -type f -exec sed -i ':begin;$!N;s/\n\([A-Z][a-z][a-z]*. [0-9A-Za-z][0-9A-Za-z]*:[0-9A-Za-z][0-9A-Za-z]*\)/ \1/;tbegin;P;D' {} \;

# # Typograhical errors in numbers
# ## 1
# find ./ -type f -exec sed -i ':begin;$!N;s/I\.\([^\n]*\n2\.\)/1.\1/;tbegin;P;D' {} \; 

# ## 10
# find ./ -type f -exec sed -i ':begin;$!N;s/\(9\.[^\n]*\n\)o\./\110./;tbegin;P;D' {} \; 

# ## 11
# find ./ -type f -exec sed -i ':begin;$!N;s/\(10\.[^\n]*\n\)II\./\111./;tbegin;P;D' {} \;  -->

























# sed ':begin;$!N;s/\n\([a-z][a-z]*[ \?]\)/\1/;tbegin;P;D'



# find ./ -type f -exec sed -i '/$/\r/' {} \;
#  find ./ -type f -exec sed -i "s|$|\r|ig" {} \;


# find ./ | cat * | tr '\n' '\r'
# \n([a-z]+[ \?]) " $1"

 

# # remove double newlines
# \n\n \n
# # newlines in questions
# (\n[0-9A-Za-z]+\..*)([\n]{1})([^0-9].*)([\n])([0-9]*\.) $1 $3$4$5
# # remove newlines within questions
# (\n[0-9]\..*)([\n]{2})([^0-9].*)([\n])([0-9]*\.) $1 $3$4$5
# (\n[0-9]\..*)([\n]{1})([^0-9].*)([\n])([0-9]*\.) $1 $3$4$5
# \n([a-z]+[^\.] ) " $1"
# \?\n([a-zA-Z]+[^\.] ) " $1"
# # verse Gen. r:6-8.
# \n([a-zA-Z]+\. [0-9a-z]+:[0-9a-z]+-[0-9a-z]+) " $1"
# \n([a-zA-Z]+\. [0-9a-z]+:[0-9a-z]+[-].[0-9a-z]+) " $1"
# \n([a-zA-Z]+\.[ ]+[0-9a-zA-Z]+:[0-9a-zA-Z]+[-].[0-9a-zA-Z]+) " $1"
# \n([a-zA-Z]+[\.]? [0-9a-z]+:[0-9a-z]+[-]?[0-9a-z]?) " $1"
# # verses Verse 14.
# \n([Vv]+erse[s]? ) " $1"
# \n([a-zA-Z0-9]+:[a-zA-Z0-9]+\.) " $1"
# # newlines
# ([a-z ]+)\n([A-Za-z]+\?) " $1"
# (\n[0-9]+\..*\n)([\n ]{1})([0-9]+\.) $1\n$3
# # 1
# (\n)I\.([^\n]*)(\n2\.)NEWLINE1.$2$3
# NEWLINE \n