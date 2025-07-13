#!/bin/bash 

echo "=== USER ACCOUNT MANAGER ==="
read -p "Enter username to check: " username
if id "$username" &>/dev/null; then 
  echo "User $username exists!"
  echo "User ID: $(id -u $username)"
  echo "Group ID: $(id -g $username)"
  echo "Home Directory: $(getent passwd $username | cut -d: -f6)"
  echo "Shell: $(getent passwd $username | cut -d: -f7 )"
  echo "Last Login: "
  last -n 1 $username
else
  echo "User $username does not exisits."
  read -p "Do you want to create this user? (y/n): " create_user
  if [[ $create_user == "y" ]]; then 
    echo "You would need sudo privileges to create user: sudo useradd $username"
  fi
fi
