---
title: "Ryan Barnard Learning Reflection"
date: 2022-01-26T13:06:54-07:00
author: Ryan Barnard
draft: true
---

## Introduction

This page is a summary of the works that I completed in my CSC-490 class at The College of Idaho. 
This course was a special topics course that focused on command line use within WSL2, IDE 
use with Visual Studio Code, and the use of git version control.

## Using WSL2

In this class I learned how to properly use the Windows Subsystem for Linux(WSL), to run Ubuntu
20.04 on my machine.

## Bash Scripting

I also learned how to write scripts in bash. One example of a script
that I wrote for this class is shown below. The purpose of this script is
to read the URLS within a given file and check that they are valid URLs.

```
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

## Command Line Use

In this class I learned not only how to navigate a linux 
system from the command line, but how to do so proficiently.
I began by learning to use bash, but eventually switched to using
zsh where I was able to modify my shell to look exactly how I want.
With zsh I learned how to load and use various plugins.
I learned to be proficient with Vim for the purpose of having
solid knowledge of a powerful text editor that I will have access
to in almost any environment.
![My Shell](/RyanBarnardZsh.png)

## Version Control

I learned how to effectively use git version control system to
collaborate on projects.

## Visual Studio

Having already been a Visual Studio Code user for a while, I was already quite
familiar with the concepts related to VSC in class. I did, however, learn many
new keyboard shortcuts to increase my efficiency by decreasing how much I need
to use my mouse.
I also learned how to write my own snippets so that I can have snippets in the
exact styling that I like to code with. 

