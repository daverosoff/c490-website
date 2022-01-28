---
title: "j-term jackposting"
author: "jack kincaid"
date: 2022-01-26T12:50:27-08:00
draft: true
---

# A reflection on CSC490-22
My student experiences in CSC-490 existed, for the most part, in a shell. Between jumping around directories in my computer's file system with <code>cd</code> during a live demonstration and creating bash scripts in [vim](https://www.vim.org/about.php), it's evident that a few commands were necessary to progress through the course. I created a quick reference table for frequently used commands. <code>man [command name]</code> is far more informative.

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
A decent chunk of course content involved learning how to navigate around file subsystems, by which I quickly became acquainted with the aforementioned commands. In addition, a portion of class content involved processing and filtering the information the terminal provides. I enjoyed trying to doctor up precisely the output I wanted to see by filtering content within the output stream. The directional operators <code>\<</code>,<code>\></code>, and the piping operator <code>|</code> were essential. Building more complex commands by "chaining" them together with <code>|</code> is both fun and utile. Here's an example that I think demonstrates how these skills can be built upon eachother to streamline user experience, which is my biggest takeaway from this class.


The output of <code>echo \$PATH</code> can be pretty revolting.

![Unfiltered result of echo $PATH](https://i.gyazo.com/825353bfb083c54cbe8179ffd8001ebc.png)


Yet it can be easily tailored by piping in a <code>sed</code> command. I'll use <code>grep</code> to exclude any results from my Windows image. Using <code>echo $PATH | sed -e 's/:<zero-width-space>/\n/g' | grep -v "mnt"</code> will first gather the ugly output from <code>echo \$PATH</code>. This output is piped (<code>|</code>) to <code>sed -e 's/:<zero-width-space>/\n/g' </code>, which graciously replaces all '<code>:</code>' characters with a newline character (<code>\n</code>). Lastly, <code>grep -v "mnt"</code> will look for content which does not contain "mnt" due to the inverse modifier <code>-v</code>.

![Filtered results of <code>echo \$PATH</code>](https://i.gyazo.com/0500745384effbe2a82c2903ab616a08.png)

Combining commands in this way is very powerful. I plan to adopt a Linux distro for software development purposes, which from experience I know is difficult without the ability to comfortably interact with a terminal. Now having practiced using regex with <code>grep -e</code>, and using a terminal more generally, I find myself eager to employ complex commands to achieve the results I want, however I might want to view them. Naturally, I also made a quick-reference table for regex syntax:

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
I am leaving this class signiciantly more capable of navigating around a command-line interface, and also using a Linux distrubition.

I was happy to learn about scripting in [bash](https://www.gnu.org/software/bash/manual/html_node/What-is-Bash_003f.html). I found that programming in bash had an extremely familiar structure. Control statements had a new flavor of syntax, (<code>[]</code> and <code>[[<zero-width-space>\]]</code>), but <code>if</code> statements will always be recognizable to me after programming at the College for almost four years now. I found that it was relatively easy to pick up bash scripting, which likely stems from my past experience coding in different languages for various assignments and personal projects. During the semester, we wrote scripts that provided useful information, such as: 
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

Speaking of git, the tail-end of our class content was centered around version control with git. We interacted with GitHub repos by forking and cloning them, as well as <code>git init</code>ializing new repositories altogether. Though, I'm no Bourne-again user. Having taken the Software Engineering capstone course only last semester, I came into this course already familiar with the idea of version control and had experience using Git. However, I'm significantly more informed about navigating a terminal. I used Git Bash during Software Engineering and was largely incompotent. I struggled to use <code>grep</code> and was scared of causing significant damage by typing something incorrectly in the terminal. I managed to survive continuous integration projects, but at the cost of many wasted hours of work, lost code, and main explosions. 

I have a more organized approach to using git now, and a few more aliases (like <code>git hist</code>) to help me. The more I use any flavor of Linux, the more certain I am that it's an incredible OS that will be indispensable to me in the future. I want a career as a software engineer, as I love using git and working collaboratively; I find that having instructions on how to use Linux *competently* and git safely only further prepare me for such a future.