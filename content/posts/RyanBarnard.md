---
title: "Ryan Barnard Learning Reflection"
date: 2022-01-26T13:06:54-07:00
author: Ryan Barnard
draft: true
---

## Introduction

This page is a summary of the works that I completed in my CSC-490 class at The College of Idaho. 
This course was a special topics course that focused on the command line use within a linux environment in WSL2, IDE 
use with Visual Studio Code, and the use of the git version control system. Though this course is not required
for the computer science major, I was very excited to take it as I knew the planned topics would be provide
very useful knowledge for anyone wanting to get into software development.


## Command Line Use

In this class I learned not only how to navigate a linux 
system from the command line, but how to do so proficiently.
I began by using a bash shell, but eventually switched to using
zsh where I was able to modify my shell to look exactly how I want.
With zsh I also learned how to use a plugin manager to
load and use various plugins. I learned to be proficient with
Vim for the purpose of having solid knowledge of a powerful
text editor that I will have access to in almost any environment.
![My Shell](/RyanBarnardZsh.png)


## Bash Scripting

I also learned how to write scripts in bash. One example of a script
that I wrote for this class is shown below. The purpose of this script is
to read the URLS within a given file and check that they are valid URLs.

```bash
#!/bin/bash

#Write a script that will test the URLS from a given file

#Check that the argument list is non-empty
if [[ "$#" -eq 0 ]]
then
	echo "Usage: ./testurls.sh FILE"
	exit 1
fi

#Check that the file path exists and leads to a file
if [[ ! -f "$1" ]]
then
	echo "Not found: $1"
	exit 2
fi

#Check that the given file is readable
if [[ ! -r "$1" ]]
then
	echo "Permission denied: $1"
	exit 2
fi

#Read the file line by line and call curl to test each url.
#Normal output is redirected to /dev/null, but we will still
#See any errors that occur.
while read -r line
do
   curl -sSf "$line" > /dev/null
done < $1
exit 0
```

I learned that bash scripts can be very powerful and very useful as
they can be used to simplify a great number of tasks that could otherwise
be quite time consuming.


## Version Control

I learned how to effectively use git version control system to
collaborate on projects and share them on github. In fact, I have
already created a couple repositories that are posted on [my github page](https://github.com/RMBarnard).
I am quite excited to now have the knowledge to use git as it opens up the
opportunity for me to find open-source projects of interest to me and contribute to them.


## Visual Studio

Having already been a Visual Studio Code user for a while, I was already quite
familiar with much of the material we covered in class. I did, however, learn many
new keyboard shortcuts to increase my efficiency by decreasing how much I need
to use my mouse.
I also learned how to write my own snippets so that I can have snippets in the
exact styling that I like to code with. 

