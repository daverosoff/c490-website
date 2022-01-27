---
title: "Skills Necessary, Taught Not"
date: 2022-01-27T13:23:10-07:00
draft: true
author: Berint Moffett
---

## Developers Need a Toolkit

The tools of a software developer are obvious on first glance. Or, at least they are to their families. We show up and fix the Wi-Fi by waving our magic voodoo fingers at the keyboard for a while before standing up and proudly pronouncing that we've finished it. Perhaps, in an advanced scenario, we even opened up the terminal and looked up some IP information for the computer.

Of course, fixing the Wi-Fi isn't exactly what a software developer goes to school for. In reality, we just Google the problem and fiddle around with some cables for a while. The real tools of a software developer are programming languages themselves. The power to wield creation itself and design our own _things_ to do our _stuff_. Programming is our tool, naturally. After all, programming makes software and what is a software developer but _one who develops software_.

### Get to the Point

An astute reader will have guessed that I mean to say that a software developer might need some additional tools in addition to the knowledge necessary to build software. Among these tools is proficiency with the terminal, proficiency with an IDE, and proficiency with Git version control.

Vital to the job description of a software developer is the ability to feel comfortable with the computer which is the primary reason that our family reaches out to us to fix the Wi-Fi.

## CSC-490 Practical Software Engineering

This course caught my eye because it teaches these skills that people often seem to dance around online. To me, it was clear for a while that these skills were going to be vital if I wanted to pursue a career of any kind in the computer science field, and yet I felt quite inept and _not_ comfortable when using these tools.

Like many times in my formal computer science education, I had a solid understanding of the topics moving into it, but certainly not a complete enough comprehension to be professionally ready. That said, this class, again like my other experiences in computer science education, still proved to be a valuable experience because of the gaps in my knowledge I desperately wanted to fill.

### Bash and Unix

My prior experience with terminal navigation comes from setting up a small computer to act as a webserver for a project I was working on. The project eventually fell defunct, but it has proven useful to have a dedicated computer to run some of my other small projects and certainly provided me with useful skills in networking and system administration.

Thus, I was pretty comfortable with the workflow of Bash going into this class. Well, I was comfortable with the "Google what I want to know and hope I find an example that actually works for me after a few hours of searching" workflow. Which is, naturally, not very helpful.

I was relieved to learn more about how Unix works as it made me much more comfortable operating my own hardware and certainly will make me more hireable in the future. Skills like increased familiarity with commands and deeper knowledge of the Bash language were acquired, to say the least.

The most difficult of the assignments given was a mockup of a potential issue demonstrated using a simulation of the WebWork system. Basically, some old symbolic links were broken as they pointed to a path that has since been renamed. The object of the script was to search a directory and find the broken, unresponsive links and replace them with properly-formed links.

```bash
#!/bin/bash

# This script finds all symlinks underneath a given directory
# that are named 'Library' and checks to see if the link target is
# /opt/webwork/libraries/webwork-open-problem-library/OpenProblemLibrary

# If not, overwrites the symlink with a correct target.

goodlink="/opt/webwork/libraries/webwork-open-problem-library/OpenProblemLibrary"

DIR="."
if [[ $1 ]]; then
    DIR=$1
fi

function fixlink {
    VAL=$(readlink $1)
    if [[ $VAL = '' ]]; then
        return 1
    fi

    if ! [[ $VAL = $goodlink ]]; then
        ln -sf $goodlink "$1"
    fi
}

for file in $(find ${DIR}); do
    if ! [[ -d "$file" ]]; then
        fixlink "$file"
    fi
done
```

This ended up being an excellent exercise for learning the bash scripting language and the idea of this sort of script is going to be something I maintain for learning new languages in the future. It requires knowledge of boolean logic and looping as well as interacting with the file system, all things necessary for fluency in a given programming language.

### IDE's and Visual Studio Code

This was the one topic out of the three which I felt I didn't need additional instruction in and I still found myself learning things throughout the process. I was happy to learn about some of the more advanced text editing features of VSCode which I was unfamiliar with as well as simply being introduced to some cool extensions which I hadn't seen before.

At the end of the day, just like any other topic, I was glad to learn more tools to improve my workflow even if I was already quite comfortable in this space compared to the others.

### Git

Which brings us to the frightening prospect of Git and version control. In a few projects before, I had attempted to integrate Git into my workflow, but it is such a huge task that is so dense to learn that I _always_ struggled to use it well and in a way that saved me time and provided me comfort in version control rather than stress.

More than a few times, I had lost work due to improperly managing my branches or mismanaged my file staging and ending up with empty commits, or accidentally commiting over work and having to delve into trying to actually utilize the version control without any knowledge of doing so and simply ending up frustrated.

Of all topics presented to me, Git was my weakest by far. To be honest, it still is. Git is dense, abstract, and difficult to utilize well.

One might say that I did not gain much out of the class, but what I did gain was a deep breath and a step back. Among learning about more actual Git syntax, I was offered perspective by the comparatively slower pace of a class compared to self research. Especially when such information is dispensed by a teacher rather than _some dude online_. I still have lots of work to do in actually learning Git and incorporating it into my project workflow, but I have been granted much better experience to be able to accomplish this goal.
