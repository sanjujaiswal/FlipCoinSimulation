#!/bin/bash -x
echo "---Welcome to coin flip simulator---"

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
largest=0;
max=""

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
			max=$( maximumCombination $showCoinSide )

	done
	echo $max;

}

#function to calculate percentage
function percentage(){
	side=$1;
	flip=$2;
	percentage[$side]=$((${coinArray[$side]}*100/$flip));
}

#function to calculate max imum combination
function maximumCombination(){
	if [ $coinArray[$1] > $largest ]
	then
		largest=${coinArray[$1]}
		maxCombination=$1;
		echo $maxCombination
	fi
}

read -p "Enter flips : " flips

#Function to get combinations of heads and tails
function getCombination(){
singletMax=$( coinFlip $flips $SINGLE_COIN )
doubletMax=$( coinFlip $flips $DOUBLE_COIN )
tripletMax=$( coinFlip $flips $TRIPLE_COIN )
}

#To display the winning combination
echo "${percentage[@]}"
getCombination
echo "Singlet winning combination is : $singletMax"
echo "Doublet winning combination is : $doubletMax"
echo "Triplet winning combination is : $tripletMax"
