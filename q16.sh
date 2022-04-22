#!/bin/bash

read -p "Enter the username: " username

if id $username > /dev/null 2>&1; then
    echo "The UID and GID of $username are: "
    id $username
else
    echo "The user $username does not exist."
fi

