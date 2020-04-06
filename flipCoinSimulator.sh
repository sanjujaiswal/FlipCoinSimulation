#!/bin/bash -x
echo "Welcome to coin flip simulator"

#Array declaration
declare -a coinArray
declare -a percentage

#Constant declaration
NUMBER=2;
SINGLE_COIN=1;
DOUBLE_COIN=2;
TRIPLE_COIN=3;

#Variable declaration
coinSide=0;

function coinFlip(){
for (( numOfFlip=1;numOfFlip<=$1;numOfFlip++ ))
do
	showCoinSide=""
	for (( coins=1;coins<=$2;coins++ ))
	do
		coinSide=$((RANDOM%NUMBER))
		if [ $coinSide -eq 0 ]
		then
			showCoinSide+="T"
		else
			showCoinSide+="H"
		fi
			coinArray[$showCoinSide]=$((${coinArray[$showCoinSide]}+1));
		done
			percentage $showCoinSide $1
	done
	echo "${!percentage[@]}  : ${percentage[@]}"
}

#function to get percentage
function percentage(){
	side=$1;
	flip=$2;
	percentage[$side]=$((${coinArray[$side]}*100/$flip));
}
read -p "Enter flips : " flips
singletMax=$( coinFlip $flips $SINGLE_COIN )
doubletMax=$( coinFlip $flips $DOUBLE_COIN )
