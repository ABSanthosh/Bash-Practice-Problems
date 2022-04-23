# Write a script to find a file using inode, entered by the user.


# read -p "Enter the file name: " file


# inode=`ls -i $file | awk '{print $1}'`


# echo "The inode of $file is $inode"

read -p "Enter the file inode: " inode

file=`find . -inum $inode`

echo "The file is $file"