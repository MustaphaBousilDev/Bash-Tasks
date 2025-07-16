#!/bin/bash

read -p "Enter a password " password
# at least 8 character long
# contains at least one uppercase letter 
# contains at least lowercase letter 
# contains at least one special characters
if [[ ${#password} -gt 8 && $password =~ [A-Z] && $password =~ [\!\@\#\$\%\^\&\*\(\)\_\+\.\,\:\;\-\=] ]];  then
  echo "Success"
else 
  echo "not success"
fi
