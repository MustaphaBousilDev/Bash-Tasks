#!/bin/bash 

read -p  "enter the name of the file:" filename
#Get Current Path
current_path=$(pwd)
path_file="$current_path/$filename"
if [ -f "$path_file" ];  then
  echo "This File existe"
  echo "========== Stats for this file: $filename =========="
  # Number of words, lines,characters
  lines=$(wc -l < "$path_file")
  words=$(wc -w < "$path_file")
  characters=$(wc -m < "$path_file") # Use -c for bytes , -m for characters
  longest_line=$(awk '{ if ( length > L ) { L=length } } END { print L}' "$filename" )

  echo "Number of lines    : $lines"
  echo "Number of words    : $words"
  echo "Number of chars    : $characters"
  echo "Longest line (chars):  $longest_line"

  
else 
  echo "File not found: $path_file"
fi

