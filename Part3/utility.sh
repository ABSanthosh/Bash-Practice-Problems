#!/bin/bash

function queryMP3(){
    touch allMP3
    find $HOME -name "*.mp3" >> allMP3
    sort allMP3 -o allMP3
}

function trackMP3(){
    touch tempMP3
    find $HOME -name "*.mp3" >> tempMP3
    sort tempMP3 -o tempMP3
    

    > newMP3
    > deletedMP3

    comm -13 allMP3 tempMP3 >> newMP3
    comm -23 allMP3 tempMP3 >> deletedMP3


    echo "Deleted MP3 files:"
    cat deletedMP3
    echo ""
    echo "New MP3 files:"
    cat newMP3


    mv tempMP3 allMP3

    echo "MP3 Database updated!"
}


case $1 in
    "query")
        queryMP3
        ;;
    "list")
        cat allMP3
        ;;
    "track")
        trackMP3
        ;;
    "search")
        # iterate through allMP3 line by line and run mediainfo on each
        # grep to find Track name Performer or any keyword
        # if found, print out the file name
        # if not found, print out "Not found"
        read -p "Enter keyword(Track Name, Artist Name, Anything else): " keyword
        echo "Searching for MP3 files..."
        
        >searchResults
        
        while read -u 10 p; do
            (mediainfo "$p" | grep -i "$keyword") >/dev/null 

            if [ $? -eq 0 ]; then
                echo "$p" >> searchResults
            fi
        done 10<allMP3

        echo "Search Results:"
        nl -b a searchResults

        read -p "Enter the number of the file you want to play: " fileNum
        fileNum=$(($fileNum-1))
        file=$(sed -n "$fileNum"p searchResults)
        cvlc "$file" --play-and-exit
        ;;
    "playRandom")
        cvlc "$(shuf -n 1 allMP3)" vlc://quit
        ;;
    "stop")
        cvlc vlc://quit
        ;;
    *)
        echo "Usage: $0 [query|play|stop|pause|resume]"
        ;;
esac