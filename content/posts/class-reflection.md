---
title: "Class Reflection"
date: 2022-01-27T16:14:56-07:00
draft: true
---

## WINTER CLASS REFLECTIONS

  c490 - bash script class has been an amazing and worth the time to learn about it.
  Bash scripting is a very important tool set in software development, management and 
  deployment. Bash scripting is also an extremely useful skill for a security professional.
   
  For instance, in Cybersecurity, a professional can use bash scripting language for navigation, 
  working with tools, and automating repetitive tasks critical areas of the software life cycle.
  Not only did we learn about bash script, we also explored efficient use of vs code, vim, git, 
  github, working in the linux enviroment using wsl on windows, customizing the shell for ease 
  nagivation, cloud enviroments, ci/cd, github actions, etc., which are all important aspects of 
  software management.

  The winter class didn't really feel that long and it feels like I didn't do much, but going through 
  the content of the class, we have done quite a bit of material. I felt like that because I had 
  so much fun in the class. I even broke a record of having not missed any class! Yay!!

  ## DEMO

  In this section, I will demonstrate what I what I have learned specically bash script. 
  This demo is one of the class assigment we did in class. However, I am using it an a 
  demo because I spent a alot of time on it when I was coding the script and researched 
  a lot such that I learned more than I ever imagined. I will explain what each line of 
  code does in the script.

  This is script basically takes a path of a file with urls as a parament, then the 
  script reads all the urls and check if that url returns a 200 http code which the 
  indicates that the url is responsive to request.

    The script below begins with the shebang, which is just a statement indication that 
    we in bash shell. The shebang can be several shells and that is why it is vital to 
    indicate the right shell.

  1 *** #!/bin/bash ***
  2
  3 # Get a path to file to read URLS from
  4 *** read -p "Enter a path of the file to read URLs from: " path ***
  5
  6 # check if the path is the path to the target file
  7 *** if [[ -f $path ]]; then ***
  8
  9     # Check if the user has read permissions
 10   *** if [[ -r $path ]]; then ***
 11
 12         # Get the size of the file
 13        *** file_size=$(stat --format=%s $path) ***
 14
 15         # Make sure the file is not empty
 16        *** if [[  $file_size < 1 ]]; then ***
 17
 18            *** echo "Usage: testurls $path. " ***
 19            *** echo "File is empty." ***
 20            *** exit 1 ***
 21
 22        *** fi ***
 23
 24         # This while loop read urls from a file one by one. Using curl, the url returns an
              http code which is parsed  from the response body
 25         *** while IFS= read -r url; do ***
 26
 27             # Here, the curl command returns an http status code that is used to check the responsiveness of the url.
 28           *** response=$(curl -I -s -o /dev/null -w'%{http_code}\n' $url) ***
 29
 30            *** if [[ $response -eq 200 ]]; then ***
 31
 32                *** echo " $url --> is responsive with http status code: $response." ***
 33           ***  else ***
 34
 35                *** echo " $url --> is not responsive. Returns http status code: $response." ***
 36           ***  fi ***
 37       ***  done < $path ***
 38
 39    *** else ***
 40
 41       ***  echo "Permission denied: $1" ***
 42
 43    *** fi ***
 44
 45 *** elif [[ -z $path ]]; then ***
 46
 47   ***  echo "Not found: $1 " ***
 48   ***  exit 2 ***
 49
 50 *** else ***
 51   *** echo "Invalid path to the file" ***
 52    *** exit 2 ***
 53
 54 *** fi ***


## IMPACT ON ME

This class helped gain valuable skills that I will be using in the software development 
process and other tech areas. The skills I have aquired are a plus to my tech stack which 
gives me the ability to deal with a variety of tech issues. I have a site that I made which 
summarizes my tech stack and other information. 

[Click here](https://nextjs-blog-pi-taupe.vercel.app/) to see the rest of my profile.
