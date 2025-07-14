#!/bin/bash

read -p "Enter a Number: " number
if (( $number%3 ==0 && $number%5==0 )); then
  echo "FizzBuzz"
elif (($number%3 ==0 )); then
  echo "Fizz"
elif (($number%5==0)); then
  echo "Buzz"
else
 echo $number
fi;
