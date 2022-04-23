#!/bin/bash

function Merge() {
	local FIRST=2
	local SECOND=$(( $1 + 2 ))
	for i in ${@:2}
	do
		if [[ $FIRST -eq $(( $1 + 2 )) ]]
		then
			echo ${@:$SECOND:1} ; ((SECOND += 1))
		else
			if [[ $SECOND -eq $(( ${#@} + 1 )) ]]
			then
				echo ${@:$FIRST:1} ; ((FIRST += 1))
			else
				if [[ ${@:$FIRST:1} -lt ${@:$SECOND:1} ]]
				then
					echo ${@:$FIRST:1} ; ((FIRST += 1))
				else
					echo ${@:$SECOND:1} ; ((SECOND += 1))
				fi
			fi
		fi
	done
}

function Sort() {
	if [[ $1 -ge 2 ]]
	then
		local med=$(( $1 / 2 ))
		local first=( $(Sort $med ${@:2:$med}) )
		local second=( $(Sort $(( $1 - $med )) ${@:$(( $med + 2 )):$(( $1 - $med ))}) )
		echo $(Merge $med ${first[@]} ${second[@]})
	else
		echo $2
	fi
}

read -p "Enter space separated integers: " -a INPUTARRAY
echo "Sorted array: $(Sort $(( ${#INPUTARRAY[@]} )) ${INPUTARRAY[@]})"

# echo ${INPUTARRAY[@]}
# echo $(Sort 10 ${INPUTARRAY[@]})


# read space separated integers and store in array

# function Merge(){
#     local FIRST=2
#     local SECOND=$(( $1 + 2 ))
#     for i in ${@:2}
#     do
#         if [[ $FIRST -eq $(( $1 + 2 )) ]]
#         then
#             echo ${@:$SECOND:1} ; ((SECOND += 1))
#         else
#             if [[ $SECOND -eq $(( ${#@} + 1 )) ]]
#             then
#                 echo ${@:$FIRST:1} ; ((FIRST += 1))
#             else
#                 if [[ ${@:$FIRST:1} -lt ${@:$SECOND:1} ]]
#                 then
#                     echo ${@:$FIRST:1} ; ((FIRST += 1))
#                 else
#                     echo ${@:$SECOND:1} ; ((SECOND += 1))
#                 fi
#             fi
#         fi
#     done
# }

# function Sort(){
#     if [[ $1 -ge 2 ]]
#     then
#         local MID=$(( $1 / 2 ))
#         local FIRST=( $(Sort $MID ${@:2:$MID}) )
#         local SECOND=( $(Sort $(( $1 - $MID )) ${@:$(( $MID + 2 )):$(( $1 - $MID ))}) )
#         echo $(Merge $MID ${FIRST[@]} ${second[@]})
#     else
#         echo $2
#     fi
# }

# read -p "Enter space separated integers: " -a INPUTARRAY
# echo ${INPUTARRAY[@]}

# echo $(Sort $(( ${#INPUTARRAY[@]} )) ${INPUTARRAY[@]})

