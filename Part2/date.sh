#!/bin/bash


R_DAY=29
R_MONTH=11
R_YEAR=02
R_DATE="$R_DAY/$R_MONTH/$R_YEAR"


I_DAY=29
I_MONTH=09
I_YEAR=03
I_DATE="$I_DAY/$I_MONTH/$I_YEAR"

ISAFTER=0

function isAfter(){

    R_YEAR=$[ $(echo $R_DATE | cut -d "/" -f 3 | sed 's/^0*//')+0 ]
    R_MONTH=$[ $(echo $R_DATE | cut -d "/" -f 2 | sed 's/^0*//')+0 ]
    R_DAY=$[ $(echo $R_DATE | cut -d "/" -f 1 | sed 's/^0*//')+0 ]

    I_YEAR=$[ $(echo $I_DATE | cut -d "/" -f 3 | sed 's/^0*//')+0 ]
    I_MONTH=$[ $(echo $I_DATE | cut -d "/" -f 2 | sed 's/^0*//')+0 ]
    I_DAY=$[ $(echo $I_DATE | cut -d "/" -f 1 | sed 's/^0*//')+0 ]

    if [ $R_YEAR -gt $I_YEAR ]; then
        # echo true
        return 1
    elif [ $R_YEAR -eq $I_YEAR ]; then
        if [ $R_MONTH -gt $I_MONTH ]; then
            # echo true
            return 1
        elif [ $R_MONTH -eq $I_MONTH ]; then
            if [ $R_DAY -gt $I_DAY ]; then
                # echo true
                return 1
            fi
        fi
    fi

    return 0
}

echo "Is $R_DATE after $I_DATE? "
isAfter $R_DATE $I_DATE
ISAFTER=$?

echo $ISAFTER

# if [[ $ISAFTER -eq 1 ]]; then
#     echo "true"
# else
#     echo "false"
# fi

# if [ $SYEAR -gt $YEAR2 ];
# then
#     echo "$SDAY/$SMONTH/$SYEAR"
#     ISAFTER=1
# else
    # if [ $SMONTH -gt $MONTH2 ];
    # then
    #     echo "$SDAY/$SMONTH/$SYEAR"
    # else 
    #     if [ $SMONTH -eq $MONTH2 ];
    #     then
    #         if [ $SDAY -gt $DAY2 ];
    #         then
    #             echo "$SDAY/$SMONTH/$SYEAR"
    #         else
    #             echo "$DAY2/$MONTH2/$YEAR2"
    #         fi
    #     else
    #         echo "$DAY2/$MONTH2/$YEAR2"
    #     fi
    # fi
# fi

