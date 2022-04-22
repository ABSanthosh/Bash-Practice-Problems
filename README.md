# Bash-Practice-Problems

1. Write a script to display all the command line arguments entered by the user.
2. Write a script to accept three numbers as command line arguments and display the
largest.
3. With reference to Q2, append the code such that it accepts only three numbers otherwise
display the message “Not entered 3 arguments….try next time…exit”.
4. Write a script to accept n numbers as command line arguments and display the sum of n
numbers.
5. Write a script to calculate factorial of number n entered by user.
6. Write a script to generate n prime numbers.
7. Write a script to calculate the sum of digits of a number n entered by user.
8. Write a script to count the set bits in a number n entered by user.
9. Write a script to print the reverse of number n entered by user.
10. Write a script to check the input string is palindrome or not. Enter the input string using
read command.
11. Write a script using case structure to generate the sum of series given below up to nth
term. Take input from user for nth term and choice a, b or c.
a) -2 + 5 + 24 + 61 + ……
b) 1 + 4 + 7 + 10 +……….
c) 3 + 6 + 11 + 27 + ………..
12. Write a script to check the existence of file entered by user. If file exist display the type
of file.
13. Write a script to check the read permission on a file entered by user. If read permission is
set, then copy the contents to “temp” file in current directory.
14. Write a shell script to count number of files (only regular file) to first level in a directory
entered by user.
15. Write a shell script to count number of files (7 types) recursively in a directory entered by
user.
16. Write a script to find the “user account number” entered by the user, exists in the system.
If yes, then display the UID and GID of that user account.
17. With reference to Q16, if user has already logged in, display the time of user login. If not,
then wait for the user to login and display the time of login.
18. Write a shell script to find all .sh files in the system and write their absolute pathname in
a file allsh in current directory.

19. Write a script to perform modified bubble sort (using concept of arrays in bash shell) for
n numbers entered by user.
20. Write a script to perform merge sort (using concept of arrays in bash shell). Data
elements of two arrays, N1 and N2 numbers will be entered by user.
21. Write a bash script to take two command line arguments. First argument is a .c program
file (assume c code written by user). Second argument is the output produced after
compiling the c program within the bash script. Display the output after placing the file in
/tmp directory.
Sample file helloworld.c
#include&lt;stdio.h&gt;
void main( )
{
printf(“Hi! I am hello world”);
}
Example
./script helloworld.c outhelloworld
Output
Output file outhelloworld is written to /tmp directory
Executing /tmp/outhelloworld
Hi! I am hello world
22. Write an automated script that reboot the system 5 time, before perfect login in to the
User account
Note: to write above script you need administrative privilege.
23. Write a script to take backup (using zip) of the files and directories entered by the user.
Place the output file in current directory.
25. Write a script to find a file using inode, entered by the user.
