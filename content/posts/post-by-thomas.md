---
title: "CSC-490 by Thomas"
author: "Thomas Bartlett"
date: 2022-01-26T13:11:58-07:00
draft: true
---

# **CSC-490: Topics in Computer Science**

## **Intro**

The course CSC-490: Topics in Computer Science at The College of Idaho has been an extremely valuable and engaging course. Although many of the topics covered in this course were topics that I had previous experience in, I was able expand on all of my previous  experiences. Throughout the course, I was consistently learning something new and applying the newly-learned skills with realistic assignments. This is a class that I wish I had been able to take earlier in my college career because it covers many of the necessary skills that I had to learn on my own. I believe that this specific Topics in Computer Science course will be incredibly helpful to help prepare the underclassmen going into Computer Science and to help reinforce important skills for the upperclassmen. 

## **Linux Command Line**

Towards the beginning of this course, we started with learning about the Linux 
command line from the following online tutorial: [Ryan's Tutorials - Linux Tutorial](https://ryanstutorials.net/linuxtutorial/). 
About three years ago I was involved in a research project at The College of Idaho that required me to have an understanding of the Linux command line.
However, three years ago, I had no experience with the Linux command line at
all. I remember using this exact tutorial to learn the basics of the Linux 
command line for the research project that I was contributing to. Even though
I had already progressed through the tutorial once, I was able to brush up on
the commands that I had forgotten and learn some more complicated ones.  

For my research project, I only learned some of the more basic commands and was not as comfortable using commands such as `grep` or `awk`. In the past, I was also not as experienced using regular expressions, piping, flags or redirection. After taking this course, I have a greater understanding of how the Linux command line functions and how to combine commands to create valuable output. One interesting website that we made use of to understand regular expressions is the [Regex Crossword](https://regexcrossword.com). This website has a variety of different regular expression crosswords in the following 
format: 

![Regex Crossword](/volapuk.png)

I found this site to be an engaging way to learn regular expressions. I
previously had an data analytics internship where I had to use regular
expressions and this website would have been a great way to learn.

## **Bash Scripting**

After learning about the Linux command line, we moved on to Bash scripting. This
is one of the topics that I had almost no previous experience with. The only 
related experience I had was creating batch files on Windows. Similar to 
learning the Linux command line, we used another [Ryan's Tutorial](https://ryanstutorials.net/bash-scripting-tutorial/).
After completing this tutorial and completing the assigned projects in class, 
I feel confident that I can create helpful Bash scripts. In the future, I can
see myself using these skills both professionally and personally to automate
certain command line tasks. Our four projects in Bash scripting were the
following:

1. `create_new_user.sh`
```bash
#!/bin/bash

# Creates a new user account
# Prompts for login/username, 
# full name, and temporary password;
# if entered user does not already exist,
# then creates account

# test for root
if [[ ${UID} -ne 0 ]]; then
    echo "error: not run as root"
    exit 1
fi

# Get user name
PROMPT="Enter the username to create: "
read -p "${PROMPT}" USER_NAME

# Does user exist?
id -u "${USER_NAME}"
if [[ $? -eq 0 ]]; then
    echo "error: user exists"
    # Repeatedly reprompt for new user name using a while loop
    while [[ $? -eq 0 ]]; do
        read -p "${PROMPT}" USER_NAME
    done
fi

# Get full name
read -p "Enter the full name of the new user: " COMMENT
# Get temp password
read -p "Enter the initial password of the new user: " PASSWORD

# Create user
# useradd -c "${COMMENT}" -m "${USER_NAME}" (not for mac!)
dscl . -create /Users/"${USER_NAME}"
dscl . -create /Users/"${USER_NAME}" RealName "${COMMENT}"

# password functions created unexpected outcomes on MacOs

exit 0
```
2. `find_big_files.sh`
```bash
#!/bin/bash

# Prints the sizes (in human-readable form) and names of the 5 largest items—files 
# or subdirectories—in a directory. Script should allow the user to enter a path on
# the command line, and default to the current directory if they don't

# Setting the directory
if [[ $# -eq 0 ]]; then
    DIRECTORY="."
elif [[ $# -eq 1 ]]; then
    DIRECTORY=$1
else
    echo "error: more than 1 argument"
    exit 3
fi

# check that directory exists; if not, exit immediately with error code 1
if [[ ! -d "$DIRECTORY" ]]; then
    # Control will enter here if $DIRECTORY doesn't exist.
    echo "error: directory does not exist"
    exit 1
fi

# check that we have read and execute permission on directory; if not, exit immediately with error code 2
if [[ ! -r "$DIRECTORY" ]] || [[ ! -x "$DIRECTORY" ]]; then
    echo "error: does not have both read and execute permission on directory"
    exit 2
fi

# Print the sizes
du -A -ha "${DIRECTORY}"| sort -hr | tail -n+2 | head -5 # exclude the total

exit 0
```
3. `test_urls.sh`
```bash
#!/bin/bash

# Reads URLs from a file (without validating them) and tests 
# whether they are responding to requests using `curl` or `wget` 

#check that argument list is nonempty; if not, emit a usage message "Usage: testurls FILE" and exist with error code 1
if [[ $# -eq 0 ]]; then
    echo "Usage: testurls FILE"
    exit 1
elif [[ $# -eq 1 ]]; then
    FILE=$1
else
    echo "error: more than 1 argument"
    exit 3
fi
# check that first argument is the path to a file that exists; if not, emit an error message "Not found: $1" and exit 
# immediately with error code 2
if [[ ! -e "$FILE" ]]; then
    # Control will enter here if $FILE doesn't exist.
    echo "Not found: $1"
    exit 2
fi
# check that we have read permission on the first argument; if not, emit an error message "Permission denied: $1" and 
# exit immediately with error code 2
if [[ ! -r "$FILE" ]]; then
    echo "Permission denied: $1"
    exit 2
fi

# use a while loop to read urls from the file and test them one by one with `curl` or `wget`. Don't forget to redirect
# unwanted output to >/dev/null. If you are still getting output, look in the man pages for options that will make `curl`
# or `wget` quieter. To achieve reading from a file with `while`, you will need to redirect input to the whole `while`
# construction as demonstrated on Monday Jan 10.

awk 'NF' "$FILE" | while read -r line || [[ -n "$line" ]] # using awk to trim blank lines 
do
    curl -s "$line" >/dev/null
    if [[ $? -ne 0 ]]; then
        echo "'$line' not responding to requests."
    fi
done

# Finally, exit explicitly with exit code 0 for success.

exit 0
```
4. `fix_symlinks.sh`
```bash
#!/bin/bash

# This script finds all symlinks underneath a given directory
# that are named 'Library' and checks to see if the link target is
# /opt/webwork/libraries/webwork-open-problem-library/OpenProblemLibrary

# If not, overwrites the symlink with a correct target.

goodlink="/opt/webwork/libraries/webwork-open-problem-library/OpenProblemLibrary"

# Test if any command line arguments are present
# If so, use $1 as the working directory
# otherwise set working directory to "."

if [[ $# -eq 0 ]]; then
    DIRECTORY="."
elif [[ $# -eq 1 ]]; then
    DIRECTORY=$1
else
    echo "error: more than one argument"
    exit 1
fi


# A function definition to overwrite a bad link with a good one

function fixlink {
    # use the command `readlink` to get the link target of the first function arg
    # save it in a variable
    # test to see if it is equal to $goodlink
    # if yes, do nothing
    # if no, use the command `ln -sf` to overwrite the existing link with a new one
    LINK_SOURCE=$(readlink "$1")
    if [[ ${LINK_SOURCE} != ${goodlink} ]]
    then
        # echo "Fixing link: ${LINK_SOURCE}"
        ln -sf "$goodlink" "$1"
    fi
}

# use a for loop over `$(find ...)` to execute fixlink function on each link
# in any child of `$1`, skipping if it is good and repairing if it is bad

#find . -type f -not -user www-data
#for file in $(find . -not -user jsmith)
for file in $(find "$DIRECTORY" -type l)
do
    fixlink "$file"
done

exit 0
```


## **Vim & Z Shell**
During the course we also familiarized ourselves with Vim as a text editor. I 
again had previous experience using Vim from previous coding experiences.
However, I still believe the section of the class covering Vim was important
because I was able to expand on my abilities and learn some new techniques 
within Vim. Learning all the available commands in Vim allows you to maneuver 
the interface so much more efficiently. Although I am nowhere near mastering
Vim, I am much more proficient at using it. 

Learning about the Z shell was something that was completely new to me. I did 
not know the real differences between a Bash shell and the Z shell, even though
the Z shell was the one I was using on my Mac. Furthermore, we were able to edit
our `.zshrc` files to customize how the shell looked and worked. Originally, I
was disappointed with the default shell settings in Terminal on my Mac. After 
editing the `.zshrc` file, the Z shell is much more helpful and informational
than before. Most of the changes have just made the shell more visually 
pleasing. Here is what it looks like now after using [Pure](https://github.com/sindresorhus/pure):

## **Visual Studio Code**

One of the most interesting topics we covered was the IDE called Visual Studio 
Code. I have used Visual Studio Code for almost all of my programming since it
is free and easy to use. However, I had never used it to its fullest extent. 
We went through many helpful extensions, keyboard shortcuts and snippets. I
found the snippets to be the most interesting part of this section. This was 
a feature that I did not know about before. However, they are now something that
I use all the time when programming. 

## **Git & GitHub**

Git & GitHub are both incredibly important to be familiar with in the software 
development world. Git is a very popular version control system and can be
helpful with handling projects of any size. The section of the course covering
Git & GitHub built upon my previous experiences and helped me better understand
how to approach different situations. For example, when to use a merge or
rebase. Learning the 'best' practices for Git & GitHub will be helpful to me in
the future as I will likely be using both very often. 

## **Conclusion**

Overall, CSC-490: Topics in Computer Science has been a very worthwhile learning
experience. Each of the topics we covered in class will be helpful in my future
projects. Having experience with these topic gives me a great platform to 
continue my journey as a developer and programmer. I am excited to begin diving 
deeper into these topics and see what else I can learn!
