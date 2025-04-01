#!/usr/bin/env bash
#
# Copyright (c) Vijay Banerjee 10-29-24
#-----------------------------------------------------------------------------
# Student Responses By: Joshua Holder 04-08-25
# CS2080 Programming With UNIX
# Bash Scripting Assignment
# DUE: 20250408

# We have already seen a few common bash commands.
# We will not take it a step further and write a full bash script using
# different bash features.
#

# Using variables
variable_name="something"

############
# Write the command to print this variable

#PROBLEM 1--------------------------------------------------------------------
#The $ allows us to access the contents of a variable to print it.
echo $variable_name
echo ""
#-----------------------------------------------------------------------------

############
# Now print the following using the variable
# "Here is the value of the variable: something"

#PROBLEM 2--------------------------------------------------------------------
#Using a little formating we can print a message with the variable's contents.
echo "Here is the value of the variable: $variable_name"
echo ""
#-----------------------------------------------------------------------------

###########

# We learned that output of a command is a stream of data that can be treated as
# a file. Similar to printing a variable, we can also use some other commands
# and use the output of the command into your text string
#
# Write the command to print the present working directory with the following
# string
# "I am currently in this directory: <name of the present working directory>"

#PROBLEM 3--------------------------------------------------------------------
#Using () around the pwd we can just print the current directory.
echo "I am currently in this directory: $(pwd)"
echo ""
#-----------------------------------------------------------------------------

##########

# Pointing to another variable using !
name="alice"
someone=name

# Now ${!someone} would reference to variable $name. Print something using the
# variable someone to instead of name, to print "alice"

#PROBLEM 4--------------------------------------------------------------------
#Using the ! we can use a pointer to print the correct name with the ${}
echo "Using the pointer we will print out the name: ${!someone}"
echo ""
#-----------------------------------------------------------------------------

# The use of special symbols to manipulate the variables is called shell
# expansion
# We have already seen some other types of shell expansions like
#  '~' exphands into the home directory
#  '`' (backtick) executes the command inside it
#  '(( ))' arithmetic expression evaluation like $((5+6))
#
#  There are seven such expansions that are more formally listed as:
#  brace expansion
#  tilde expansion
#  parameter and variable expansion
#  command substitution
#  arithmetic expansion
#  word splitting
#  filename expansion
#
#  The best place to read more is: https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions
#
#  Instead of going through each of these, we will notice their use when a
#  usecase arises
#

# Functions
#

printit(){
    echo "my name is $1" #Taking the first parameter passed
    echo "Our names are  $*" #Taking all parameters
}

printit alice bob

# Conditional

# syntax is
# if some-command; then
#    <Do something here if command is true>
# elif some-other-command; then
#    <Do the other thing here>
# else <Do something if nothing else is true>
# fi 
#
# Remember to close the block with fi

#
# Write a function called "cond_test" that takes two inputs
# If the first input is similar to second input, it will print "hello"
# else it will print "bye"

#CONDITIONAL FUNCTION 1-----------------------------------------------------
#Print prompt message to instruct user

echo ""
echo ""
echo "Conditional test function will see if two inputs provided are equal."
echo "If they match, then hello will print, otherwise bye"

#Start the function to read first and second word from user
cond_test(){

    #Prompt and read both individual words from the user
    echo "Enter first word..."
    read input1
    echo "Enter second word..."
    read input2

    #Conditional statement to see if both strings are equal to each other
    if [[ $input1 == $input2 ]]

    #If they are equal then hello will print otherwise bye
    then
        echo "hello"
    else
        echo "bye"
    fi        
}

#Call the cond_test function
cond_test
echo ""
echo ""
#-----------------------------------------------------------------------------



#
# To check if the strings are equal, use the following command
#
# [[ input1 == input2 ]] 
# In bash [[ ]] is basically a command that evaluates wheter or not the
# statement inside is true. Some other common conditionals are
#
# [[ -n STRING ]] check if string is not empty
# [[ STRING != STRING ]] 
# [[ number -eq number2 ]] to check if two numbers are equal
# [[ number -lt number2 ]] less than
# [[ number -gt number2 ]] greater than
# [[ number -ge number2 ]] greater than or equal to
# (( number > number2 )) evaluate the math and return something

# Now write a function that prints two numbers on screen and takes an input. if
# the input equals to the sum of the two number, it prints "correct" else it
# prints "incorrect"

#CONDITIONAL FUNCTION 2---------------------------------------------------------
#Function will generate two random numbers between 1 and 10. User will then be
#prompted to enter the sum and a if statement will tell if the user is correct
#or incorrect

echo "Conditional test function will generate two random numbers and prompt"
echo "to enter the sum of the numbers."

random_sum() {

    #Generate both random numbers that will populate between 1 and 10
    random1=$((RANDOM % 10 + 1))
    random2=$((RANDOM % 10 + 1))

    #Print both of the random numbers and prompt the user to enter the sum
    echo "First Random number is $random1. Second Random number is $random2."
    echo "What is the sum of both random numbers?"
    read input

    #Calculate the sum of the two random numbers
    random_sum=$(($random1 + $random2))

    #If satement that will compare the user input with the calculated sum
    #If the correct sum is entered Correct! will print otherwise Incorrect!
    if [[ $input -eq $random_sum ]]
    then 
        echo "Correct!"
    else
        echo "Incorrect!"
    fi    
}

#Call the random_sum function
random_sum
echo ""
echo ""
#-----------------------------------------------------------------------------

############################
# Once done with it 
# Use a while loop
# while :
# do
#     something
# done
# 
# to write the previous function with an infinite loop
# This time, generate random two numbers and check if the input sum is correct
#
# Note $RANDOM gives a big random number. But taking a modulo of that number
# with any number n would ensure that the random number is always within the
# range of 1-n

#CONDITIONAL FUNCTION 3---------------------------------------------------------
super_fun_random_sum() {

    echo "Now we are entering the super fun never ending math loop!"

    #While loop that will continue to cycle until user enters the exit code "exit"
    #Loop will continue to populate two random numbers between 1 and ten and prompt
    #the user to enter the sum. If/Else will print correct or incorrect and a elif
    #statement will break the loop if the user enters exit
    while :
    do

        #Generate two random numbers between 1 and 10
        random1=$((RANDOM % 10 + 1))
        random2=$((RANDOM % 10 + 1))

        #Calculate the sum of the two random generate numbers
        random_sum=$(($random1 + $random2))

        #Store the exit code into a variable
        exit_code="exit"

        #Prompt the user with instructions and print the two random numbers then
        #read the input from the user
        echo "Random Numbers between 1 and 10 are generated."
        echo "Enter the sum of the two numbers OR exit to end loop."
        echo ""
        echo "What is the sum of: $random1 and $random2 ?"
        read input

        #If statement that will test if the user input is equal to the calculated sum
        #if the user enters the correct sum CORRECT! will print otherwise INCORRECT!
        #elif statement that will also be looking for the string "exit" to be entered
        #and that will cause the loop to end
        if [[ $input -eq $random_sum ]]
        then 
            echo "CORRECT!"
        elif [[ $input == $exit_code ]]
        then
            echo "Exit code entered... exiting loop!"
            break
        else
            echo "INCORRECT!"
        fi         
    done
}

#Call the super_fun_random_sum function
super_fun_random_sum
#-----------------------------------------------------------------------------

