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
very useful knowledge for anyone wanting to get into software development which is a field I am considering pursuing
a career in post-graduation.


## Command Line Use

In this class I learned not only how to navigate a linux 
system from the command line, but how to do so proficiently.
I began by using a bash shell where I learned the basics of directory
navigation, scripting, and package installation using apt. 
Eventually, however, I switched to using zsh where I was able
to modify my shell to look exactly how I want. With zsh I also
learned how to use a plugin manager to load and use various plugins.
I also learned to be proficient with Vim for the purpose of having solid knowledge of a powerful
text editor that I will have access to in a large number of environments.
![My Shell](/RyanBarnardZsh.png)


## Bash Scripting

While learning to use Vim, I also learned how to write bash scripts. One example of a script
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
During the time we spent on version control, we went over what a
typical workflow might look like as a developer. You sit at your computer, pull
any changes that may have been made since the last time you worked,
checkout your topic branch and begin working and making commits as you go.
We then went over the pull request request process and learned how we can contribute
the changes we made on our own fork and branch into a shared project.


## Visual Studio Code

Having already been a Visual Studio Code user for a while, I was already quite
familiar with much of the material we covered in class. I did, however, learn many
new keyboard shortcuts to increase my efficiency by decreasing how much I need
to use my mouse and I learned how to properly configure my launch.json file to support
debuggers for various languages that I can now activate with keyboard shortcuts.
I also learned how to write my own snippets so that I can have snippets 
configured exactly the way I like. One of my goals for the future is to continue
practicing using as many keyboard shortcuts as I can in order to reduce how much
I have to use my finnicky laptop touchpad mouse.

## Conclusion

In conclusion, I have learned a number of skills in this class that will be
very applicable in a real job setting. I now know how to appropriately use
version control and how to create pull requests to contribute to projects. I
also know how to perform a number of actions from the command line and how I can
use Vim from the command line to edit text files. I learned that there is even
more I can do to make myself even more comfortable with my IDE and increase
my efficiency when coding. I plan to practice using the skills I have learned in
this class by finding projects of interest to me on GitHub and contributing to them.
This will allow me to not only practice coding, but also coding in various languages
in styles that are acceptable by each project. It will also allow me to practice going
through a workflow routine.
In all, I am very glad I chose to take this course even though it was not required as
I feel that I have learned things that will help me in whatever development related
job I may end up in in the future.