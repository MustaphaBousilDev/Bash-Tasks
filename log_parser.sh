#!/bin/bash

log_file="log.txt"
#counters
info_count=0
error_count=0
warning_count=0

# temp file to store error messages
error_message_tmp=$(mktemp)

while read -r line; do
  if [[ $line == *"INFO"* ]]; then
    ((info_count++))
  elif [[ $line == *"ERROR"* ]]; then
    ((error_count++))
    message=$(echo "$line" | cut -d' ' -f5-)
    echo "$message" >> "$error_message_tmp"
  elif [[ $line == *"WARNING"* ]]; then
    ((warning_count++))
  fi
done < "$log_file"

#display result
echo "INFO count: $info_count"
echo "ERROR count: $error_count"
echo "WARNING count: $warning_count"

echo -e "\nUnique ERROR messages:"
sort "$error_message_tmp" | uniq

#clean up
rm "$error_message_tmp"
