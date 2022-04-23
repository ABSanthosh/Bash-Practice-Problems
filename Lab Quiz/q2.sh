#!/bin/bash

function takeInput(){
    read -p "Enter Mobile ID: " MID
    read -p "Enter Name: " NAME
    read -p "Enter Model: " MODEL
    read -p "Enter Manufacturer: " MANUFACTURER
    read -p "Enter Date of Relese: " DOR
    read -p "Enter Cost: " COST
    read -p "Enter Supported OS: " OS

    writetofile $MID $NAME $MODEL $MANUFACTURER $DOR $COST $OS
}

function writetofile(){
    echo "$MID | $NAME | $MODEL | $MANUFACTURER | $DOR | $COST | $OS" >> mlist
}

function printnth(){
    echo "${cat mlist | sed -n "$NTHp"}"
}

function printAvgPrice(){
    MANU=$MANUFACTURER
    SUM=0
    COUNT=0
    SUM=$(cat mlist |grep $MANU | awk -F "|" '{sum+=$6} END {print sum}')
    COUNT=$(cat mlist | grep $MANU |awk -F "|" '{count+=1} END {print count}')

    echo "AVG: $(($SUM/$COUNT))"
}

function printYear(){
    echo $(cat mlist | grep $YEAR)
}

read -p "Enter Option: " OPTION

case $OPTION in
    a)
        read -p "Enter n:" NTH
        printnth "$NTHp"
        ;;
    b)
        read -p "Enter Manufacturer: " MANUFACTURER
        printAvgPrice $MANUFACTURER
        ;;
    c) 
        read -p "Enter year(yyyy): " YEAR
        printYear $YEAR
        ;;
    d)
        for i in eval echo "{1..16}"
        do
            takeInput
        done
        ;;
    *)
        echo "Invalid Input"
        ;;
esac