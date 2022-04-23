#!/bin/bash


function getInput(){
    read -p "Enter ID: " ID
    read -p "Enter Name: " NAME
    read -p "Enter Position: " POS
    read -p "Enter Department: " DEPT
    read -p "Enter Date: " DATE
    read -p "Enter Salary: " SALARY

    appendToFile $ID $NAME $POS $DEPT $DATE $SALARY
}

function appendToFile(){
    echo "$ID | $NAME | $POS | $DEPT | $DATE | $SALARY" >> emp.list    
}

touch emp.list

CONFIRMATION=1

function newRecords(){
    while [ $CONFIRMATION -eq 1 ]
    do
        getInput

        read -p "Confirm? (y/n): " MOREINPUT
        if [ $MOREINPUT == "y" ];
        then
            CONFIRMATION=1
        else
            CONFIRMATION=0
        fi
    done
}

function isAfter(){

    R_YEAR=$[ $(echo $R_DATE | cut -d "/" -f 3 | sed 's/^0*//')+0 ]
    R_MONTH=$[ $(echo $R_DATE | cut -d "/" -f 2 | sed 's/^0*//')+0 ]
    R_DAY=$[ $(echo $R_DATE | cut -d "/" -f 1 | sed 's/^0*//')+0 ]

    I_YEAR=$[ $(echo $I_DATE | cut -d "/" -f 3 | sed 's/^0*//')+0 ]
    I_MONTH=$[ $(echo $I_DATE | cut -d "/" -f 2 | sed 's/^0*//')+0 ]
    I_DAY=$[ $(echo $I_DATE | cut -d "/" -f 1 | sed 's/^0*//')+0 ]

    if [ $R_YEAR -lt $I_YEAR ]; then
        return 1
    elif [ $R_YEAR -eq $I_YEAR ]; then
        if [ $R_MONTH -lt $I_MONTH ]; then
            return 1
        elif [ $R_MONTH -eq $I_MONTH ]; then
            if [ $R_DAY -lt $I_DAY ]; then
                return 1
            fi
        fi
    fi

    return 0
}


read -p "Select one of the following:
a) List first n records
b) Average salary of employee from a department (user will enter the department name)
c) Name of all employees born after dd/mm/yy
d) List the name of employees that have the same designation (user will enter the designation)
e) Extract the data for all the records based on fields entered by the user.
f) Add new Employee
Your choice: " OPTION



case $OPTION in
    a)
        read -p "Enter the number of records to be listed: " N
        head -n $N emp.list
        ;;
    b)
        read -p "Enter the department name: " DEPT
        SUM=$(less emp.list | grep $DEPT | cut -d "|" -f 6 | awk '{sum+=$1} END {print sum}')
        COUNT=$(less emp.list | grep $DEPT | cut -d "|" -f 6 | awk '{count+=1} END {print count}')
        echo "The average salary of employees from $DEPT is $[$SUM/$COUNT]"
        ;;
    c)
        read -p "Enter the date: " DATE

        ARRAY=()
        ARRAY+=($(less emp.list | cut -d "|" -f 5 | cut -d "/" -f 1,2,3 | awk {'print'}))

        for i in "${ARRAY[@]}"
        do
            I_DATE=$DATE
            R_DATE=$i
            if isAfter; then
                echo $(less emp.list | grep $i)
            fi
        done

        ;;
    d)
        read -p "Enter the designation: " DESIGNATION
        less emp.list | grep " $DESIGNATION" | cut -d "|" -f 2 | awk {'print $1 $2; printf("")'}
        ;;
    e)
        read -p "Enter any data from the record: " VALUE
        less emp.list | grep $VALUE | awk {'print; printf("")'}
        ;;
    f)
        CONFIRMATION=1
        newRecords
        ;;
    *)
        echo "Invalid option"
        ;;
esac

