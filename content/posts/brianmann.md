---
title: "My educational experiences"
date: 2022-01-26T13:24:53-07:00
draft: false
author: Brian Mann 
---
I was initially introduced to this as a suggestion from my professor last year. It was described as a rather fun class which wasn't a requirement for the major. I decided to take it because it sounded like something that would help stimulate my thinking sponge for a while since it promised so much variety in the topics related to computer science. Plus, it would probably be a million times no interesting than my last winter term course. Thankfully I wasn’t wrong, but I wasn’t entirely right either. I was definitely a new venture which pushed me into many unknowns and forced me to reassess my core understanding of how coding project's function, but the downside was I wanted more experience to further enhance my skills and to fully see what this knowledge could be applied to in the field. Though to understand why I felt this way its best to start with what occurred in class. 

During the course of my time in CSC-490, I learned the basics of the Linux operating system, Visual Studio Code, and the GitHub networking system. The first was in hindsight the easiest to pick up and understand. My only initial troubles were figuring out where it was on my computer, and a couple of coding assignments such as.. 

 


```bash
code goes here
#Check for nonempty argument

if [[ "$#" -eq 0 ]]; then
	echo "Usage: testurls FILE"
	exit 1
fi

#Check if first argument is path
if [[ ! -f "$1" ]]; then
	echo "Not Found: $1"
	exit 2
fi

#Check for read permission
if [[ ! -r "$1" ]]; then
	echo "Permission Denied: $1"
	exit 2
fi

#Read and test URLs
while read -r url; do
  curl $url --output  /dev/null --silent --head --fail
  if [[ "$?" -ne 0 ]]; then
	 echo "$url isn't accessible"
  fi 
done < "$1"
exit 0

and

# Prints the names and sizes of the 5 biggest items (files/directories) in a given directory

PROMPT="Enter path to file/directory you want to look at: "
read -p "${PROMPT}" INPUT
if [[ "$#" -eq 0 ]]; then
	PATHNAME="."
	cd $PATHNAME
else
	PATHNAME="${INPUT}"
	cd $PATHNAME
fi
#Check if directory exists
if ! [[ -e "${PATHNAME}" ]]; then
	exit 1

fi
#Check if we have read and execute permissions
if ! [[ -r "$PATHNAME" ]] && ![[ -x "$PATHNAME" ]]; then
	echo "File does not have read and execute permissions for user"
	exit 2
else
#Format items as <file size> , <file name>
	du -ha "$PATHNAME" | sort -rh | tail -n +2 | head -5
fi
exit 0
```

At the time I sort of understood the point of it. A built in means or creating and organizing the coding files we create, just through
the means of a window terminal which requires code to navigate through and edit everything. Though admittedly I didn’t care much about
 it because of the primitive looking design. It made me feel like I was coding in the eighties. Though my views on it began to shift 
 once we started to explore the other systems and how they contribute to one another. 

The next was Visual Studio Code, which I was ready for. I already had some experience with it from using it’s debugger feature last
year, so it brough a nice sense of familiarity to the course while also offering something new. It felt like a modern coding software
with its UI and various quality of life features. Such as the multiple shortcuts which help minimize usage of the mouse during coding
sessions, the multiple font styles you can download to improve the readability of it to non-coders, and especially the debugging 
feature. It was a godsent back then to help me pinpoint the errors in my algorithms, and it will continue to be a godsent when I use it
 in future classes.

One thing to note is how it made me realize the importance of Linux as an operating system with how the two interact with each other.
It essentially allows users to create a workflow amongst themselves. Each person within their own Linux system creates chunks of code
representing features of a much bigger program. Then they can share their programs with the other teammates via Visual Studio Code to
help edit and debug it until it is perfect. Then they can save said changes and eventually implement it into the larger program.
Though the last thing we learned really shook up how workflows can function. 

Git and subsequently GitHub are systems which essentially allow for developers to work on the same code but each person can add their
own spin on it to see who’s is better. They do this by creating a repository to hold the files, then creating branches. These act as
pointers for the same file, but whatever you do in one branch gets saved, while the other branch might stay exactly the same
depending on if someone else edited the code themselves. If that version of the code works best with the rest of the project, they
can merge that
 section into the main branch as part of the ever increasing project. While the other can still tinker with their branches to see if
they can shifted into something else which could be added to the main branch. 

Then there was the server GitHub, which allowed you to share your repositories and code with people across the globe. Allowing for nigh
infinite collaborative potential and possibilities for different ways to code the project which could make it much more intuitive and
efficient. 

In general this class and the things I learned from it really made me think about how collaborative coding projects have functioned 
for me in the past and hoe they could function if more students were aware of the systems taught in this class. It made me think about
if this class should actually be a required class for the major due to its potential for widespread implementation within the various 
fields of computer science. Given its proven capabilities as a means to create a more efficient workflow for coding projects, it has 
an unlimited amount of applicability for students working towards certain career paths. If changed into a required class, it opens the
gates for the students of this school to become coding machines. 
 
Personally I don’t know if this has shifted what I want to do for my career as I still don’t have a clear direction for where I’ll go
after I graduate. What I do know is I would be extremely interested in finding a way to convince my employer to implement these
systems into whatever company workflow I become a part of, or at least work for a company that has this kind of workflow. 