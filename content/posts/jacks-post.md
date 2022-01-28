---
title: "j-term jackposting"
author: "jack kincaid"
date: 2022-01-26T12:50:27-08:00
draft: true
---

# A reflection on CSC490-22
My student experiences in CSC-490 existed, for the most part, in a shell. Between jumping around directories in my computer's file system with <code>cd</code> during a live demonstration and creating bash scripts in [vim](https://www.vim.org/about.php), it's evident that a few command line arguments were necessary to progress through the course. I created a quick reference table for key commands I didn't want to forget or used fairly frequently. Admittedly, <code>man [command name]</code> is far more informative. In any case, here's my table:

| Command      | Action | Modifiers & Notes|
| ----------- | ----------- | ----------- |
| <code>sudo</code>   | super user do |        |
| <code>sed</code>   | find and replace      |      |
| <code>grep</code>   | filter stream or file        | -e(grep)      |
| <code>egrep</code>   | filter stream or file with regEx |  |
| <code>mv</code>   | move file | can also be used to rename files       |
| <code>rm</code>   | remove file | permanent. -i(nteractive) -R(ecursive) |
| <code>cp</code>   | copy file | -t(ranspose) makes directory first arg, source(s) after       |
| <code>cat</code>   | read from file |        |
| <code>mkdir</code>   | make directory |        |
| <code>cd</code>   | change directory | . current dir, .. parent dir, - most recent dir, ~ home dir |
| <code>ls</code>   | list contents of current directory | -l(ong) -a(ll) -R(ecursive) -h(uman readable) -S(ort, decreasing, by size) |
| <code>echo</code>  | print | echoing into other things can be destructive. |
| <code>curl/code>/<code>wget</code>   | grab file(s) from url |        |

Other useful commands I learned from this semester who did not make it into the table above include: <code>file</code>, <code>touch</code>, <code>pwd</code>, <code>ps</code>, <code>htop</code>, and <code>whoami</code>.

## echo \$PATH is gross
##### Building complex commands is essential
A decent chunk of course content involved learning how to navigate around file subsystems, by which I quickly became acquainted with the aforementioned commands. In addition, a portion of class content involved processing and filtering the information the terminal provides. I enjoyed trying to doctor up precisely the output I wanted to see by filtering content within the output stream. The directional operators <code>\<</code>,<code>\></code>, and the piping operator <code>|</code> were essential in doing this. Building more complex commands by "chaining" them together with <code>|</code> is both fun and utile, such as in the use case below.


The output of <code>echo \$PATH</code> can be pretty revolting.

![Unfiltered result of echo $PATH](https://i.gyazo.com/825353bfb083c54cbe8179ffd8001ebc.png)


Yet it can be easily tailored by piping in a <code>sed</code> command. I'll also use <code>grep</code> to exclude any results from my Windows image, since visually this is fairly busy otherwise. Using <code>echo $PATH | sed -e 's/:<zero-width-space>/\n/g' | grep -v "mnt"</code> will first gather the ugly output from <code>echo \$PATH</code>. This output is piped (<code>|</code>) to <code>sed -e 's/:<zero-width-space>/\n/g' </code>, which graciously replaces all '<code>:</code>' characters with a newline character (<code>\n</code>). Lastly, <code>grep -v "mnt"</code> will look for content which does not contain "mnt" due to the inverse modifier <code>-v</code>.

![Filtered results of <code>echo \$PATH</code>](https://i.gyazo.com/0500745384effbe2a82c2903ab616a08.png)

Combining commands in this way is very powerful. I plan to adopt a Linux distro for software development purposes, which from experience I know is much harder without the ability to comfortably interact with a terminal. Now having practiced using regex with <code>grep</code>, and command line use more generally, I find myself eager to filter most content my terminal is spittng at me when I have a question for it. I am a lot more comfortable doing this now, and am excited to better incorporate pattern matching in code outside of a command line environment as well. Naturally, I also made a quick-reference table for regex syntax:

| Character(s)     | Function      | Notes    |
| ---------------- | --------- | ----------- |
| <code>.</code>   | matches any single character          |             |
| <code>[]</code>  | group matches any enclosed characters          | range [x-y], exclude [==\^==<zero-width-space>x-y]            |
| <code>*</code>   | matches 0 or more times          |             |
| <code>?</code>   | matches 0 or 1 times          |             |
| <code>+</code>   | matches 1 or more times          |             |
| <code>{}</code>  | number of times preceding atom must be matched          | {n,m} causes preceding atom to be matched x times, where  n $\le$ x $\le$ m         |
| <code>^</code>   | matches at beginning of line          |             |
| <code>$</code>   | matches at end of line          |             |
| <code>\n</code>  | reuse nth captured group (where n is a digit 0-9)          | groups are enclosed by parentheses            |
| <code>\b</code>  | word boundary          |             |

## Some things never change
##### You still get to code in Computer Topics
I am leaving this class signiciantly more capable of navigating around a command-line interface, and also using a Linux distrubition generally. Part of why I can confidently say this is that I now have practice writing scripts in [bash](https://www.gnu.org/software/bash/manual/html_node/What-is-Bash_003f.html). While similar to programming in a practical coding environment like VSCode, creating scripts in the vim editor feels different, but familiar. During the semester, we wrote scripts that provided useful information, such as: 
- a script to create a new system user (useful in server management, a popular application of Linux systems)
- a script to display the five biggest files in a directory, in a humanly-comprehensible way
- a script to read from a file of URLs that tests whether each URL responds to a <code>curl</code> or <code>wget</code> request

Fun fact: it's easy to remember how to begin a bash script - they are prefaced with a "shebang", <code>#!</code>.

## Improving workflow
##### Create the perfect environment for completing overdue work items
While I started the course using bash, demonstrations on how to trick out and configure [zsh](https://www.zsh.org/) encouraged me to quickly ditch the former shell in favor of a significantly better user experience, which included features such as command predictions, exposing current directory contents under the command line, and more. I've even found myself customizing my user experience further with the <code>alias</code> command, which allows one to create new command line functions. Here's one that I made to quickly jump into working on a GitHub project:

![sgit](https://i.gyazo.com/b62c68c4bdb30cf42c72e8961bb2537d.png)

The <code>sgit</code> command initializes the ssh-agent, adds a specific SSH key connected to my GitHub account to the current session of ssh-agent, and then authenticates my connection to GitHub. This is just one example of how the techniques I have learned in this class have already improved my workflow and the ways I interact with a terminal. Assuredly, typing '<code>sgit</code>' most definitely beats typing three separate commands every time I want to interact with a GitHub repo.

## git gud
##### (or break main trying)

Speaking of git, the tail-end of our class content was centered around version control with git. We interacted with GitHub repos by forking and cloning them, as well as <code>git init</code>ializing new repositories altogether. Though, I'm no Bourne-again user. Having taken the computer science capstone Software Engineering course only last semester, I came into this course already familiar with the idea of version control and experience using Git. However, I'm significantly more informed about navigating a terminal. I used Git Bash during Software Engineering and was largely incompotent in this environment. I struggled to use <code>grep</code> and was scared of causing significant damage by typing something incorrectly in the terminal. I managed to survive continuous integration projects, but at the cost of many wasted hours of work, lost code, and main explosions. This course helped solidify my takeaways on git version control and expanded on my previous knowledge of git interactions in a terminal environment. For example, during class we added the alias <code>git hist</code> to our shells, a command which provides a very clear history of commits and merges within a project's timeline. 