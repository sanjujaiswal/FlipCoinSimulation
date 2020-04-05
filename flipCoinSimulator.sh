#!/bin/bash -x
echo "Welcome to coin flip simulator"

#Constant declaration
NUMBER=2

#Variable declaration
coinSide=0

coinSide=$((RANDOM%NUMBER))

if [ $coinSide -eq 1 ]
then
	echo "HEAD"
else
	echo "TAILS"
fi
