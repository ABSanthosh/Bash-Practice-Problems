#!/bin/bash

read -p "Enter the username: " username

if grep -q $username /etc/passwd
then
    echo "User is already logged in"
    echo "Last login time: "$(last $username | tail -1 | awk '{print $3, $4}')
else
    echo "User is not logged in"
    echo "Please login and try again"
fi