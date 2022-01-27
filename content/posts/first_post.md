---
title: "What we're doing here"
date: 2022-01-26T08:03:22-07:00
author: Dave Rosoff
draft: false
---
## A summation of your work this term

Here we'll collect your examples and reflections of your best work
this semester. I've written a short post below to summarize what
the class did, and how the pieces of the class come together to
form this site.

### Hugo for static website generation

Traditional blogs and content management systems (Wordpress, Canvas)
use databases to store their content. Each page is dynamically
generated as it is served, meaning the actual web content you see
has to be created on the fly as your request arrives at the server.
This is why it takes a bit of time for your Canvas page to load.
The database has to be queried, respond, and the HTML assembled. It's
still fast enough, but there's a noticeable delay (a few hundred to
a few thousand milliseconds).

This site doesn't use a database and all its content is statically generated,
so it loads very quickly. We write the web pages in plain text (Markdown) and
configure its appearance and behavior in plain text configuration files. The
`hugo` engine will, on command, generate all the necessary HTML and CSS from
our source. The source is version-controlled with `git` and GitHub, so any
collaborator can add content by forking the site, creating a branch, and
submitting a PR on GitHub. Naturally, the Markdown content files can be edited
in any plain text editor, e.g. `vim` or VS Code.

The rest of this post is a copy of the Canvas assignment that describes what
to do to complete this final assignment.

## Text of Canvas assignment

Hugo is a tool for generating static web sites. It is written in the Go language developed by Google, which makes it highly portable. (Portable refers to code that easily runs on different operating systems or system architectures.) In this assignment, you'll use all your skills so far to install it, fork a website, and start contributing (with a post summarizing your reflections on the class and some examples of your work).

### Installing Hugo

Visit the [Hugo releases page](https://github.com/gohugoio/hugo/releases) and download the hugo binary that is appropriate for your system:

*   For Windows users running WSL or other virtual machine Linux environment, choose [hugo_0.92.0_Linux-64bit.tar.gz](https://github.com/gohugoio/hugo/releases/download/v0.92.0/hugo_0.92.0_Linux-64bit.tar.gz)
*   For macOS users, choose [hugo_0.92.0_macOS-64bit.tar.gz](https://github.com/gohugoio/hugo/releases/download/v0.92.0/hugo_0.92.0_macOS-64bit.tar.gz)

The easiest thing to do is just save the file from the web into your normal
Downloads folder. macOS and those running full Linux graphical VMs can leave it
there. On WSL, you can go:

```
mv /mnt/c/Users/your-windows-username/Downloads/hugo_0.92.0_Linux-64bit.tar.gz ~
```

to move the file out of the Windows side and into the WSL side.

Next, go:

```
echo $PATH
```

and check to see whether a directory called `/home/your-wsl-username/bin` is in
there. If not, go

```
echo "export PATH=$PATH:/home/your-wsl-username/bin" ~/.zshrc
```

This assumes you are using `zsh` as your shell. If you also use `bash`, you
might want to repeat the previous command for `.bashrc` instead of `.zshrc`. At
this point, you can either close your shell and open another (so that your
config file is reloaded) or just run `znap restart` to restart `zsh`.

Finally, navigate to the directory where you put the `.tar.gz` file and extract
it (remember, substitute the right values for my obvious variables in commands)

```
cd /path/to/hugo-install-file.tar.gz
tar xvfz hugo-install-file.tar.gz
```

This will extract three files from the archive. (`.tar.gz `is a historical
archive format comparable to `.zip`). You can delete or ignore `README.md` and
`LICENSE`, and move the hugo executable into `~/bin`. Finally you can delete
the archive file itself if you wish, but first maybe verify that hugo is
properly installed with

```
hugo version
```

Congratulations, you have successfully installed `hugo`. (There are other ways to
install it, too, but this is simplest for a single-user system.)

### Forking the class website

Visit the website repo on GitHub at
[https://github.com/daverosoff/c490-website](https://github.com/daverosoff/c490-website)
and fork the site. Clone your fork (with SSH!) to your local machine.

After you do the clone step, there is one additional step needed to get
everything set up. This git repository has a *git submodule* that needs
to be initialized:

```
git submodule update --init themes/ananke
```

Submodules are how you can embed other git repos into your own. This one is a
Hugo theme that isn't provided by the base Hugo package. After you have
initialized your submodule, navigate in the shell to your clone and open the
top-level directory of the clone (probably called `c490-website`, unless you
chose to rename it) in VS Code. In the Editors pane you should see directories
called `archetypes`, `content`, `data`, `layouts`, etc. Open up the
`content/posts` directory. You should see the first post that I wrote this
morning, called `first_post.md`. Back in your shell, make sure you are still in
the c490-website directory and go

```
hugo new posts/your-post-name.md
```

You can name the file whatever you like, but if you put your name in it, we're
less likely to have filename conflicts. Writing a post and getting it into the
site is your assignment.

Back in VS Code, your new file should have appeared in the Editors pane. The
metadata section is on top and it has a familiar JSON-ish look. Change your
post title and add an author: field to the metadata section. Underneath, start
writing! You should read a Markdown guide if you haven't used Markdown before
(and of course look at the source of the existing post on the site). Here are a few:

*   [GitHub enables Markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) in all comments on the site, with some extensions called GitHub-flavored Markdown
*   [Standard Markdown is described here](https://www.markdownguide.org/basic-syntax/)
*   If you just want a cheat sheet, [try this one](https://www.markdownguide.org/cheat-sheet/)

### Writing your post

Since we have today and tomorrow to work on it, I'd like you to write a longer
reflection statement than I have asked for in other classes. I think 900–1200
words is a good range. (Remember, you know how to count words in plain text
files from the command line.) Use the rich features of Markdown intelligently
to include links to other web pages, images, video, etc., as appropriate. Read
over the rest of the description of the assignment before you come back to this
section to start writing.

Here are some prompts (adapted from
[http://ose.arizona.edu/sites/ose.arizona.edu/files/Reflection%20Tool%20Kit.pdf](http://ose.arizona.edu/sites/ose.arizona.edu/files/Reflection%20Tool%20Kit.pdf))
to help you get started. You don't necessarily need to address all these
questions in order. Take some time to think about what you'd like to say. I
would like to see your best writing. Ultimately I'd like these to wind up in
your Portfolium. Some of what you write might also be good to include in your
course evaluation survey, but here, you should focus on yourself and your
learning rather than on the design and delivery of the course.

*   Describe the experience: what did you hear, see, read, and do?
*   How has the experience helped you apply or transfer your learning to a new context?
*   How has the experience increased your curiosity or awareness about new ideas or techniques?
*   How has this classroom experience built upon the rest of your education?
*   In what ways has your learning empowered you to explore new parts of software development?
*   What aspect of the classroom experience contributed most to your learning, and why?
*   What new insights did you develop regarding your career plans as a result of this class?
*   How would you describe this class experience to a potential employer in a way that synthesizes knowledge and skills gained?

### Making commits

Along the way, you should commit your work every so often to a topic branch on
your clone. Use the `git` commands in VS Code (try the Command Palette) to add a
new remote called `upstream` with address
[https://github.com/daverosoff/c490-website.git](https://github.com/daverosoff/c490-website.git)
and then create a new branch. You could call your branch `my-first-post` or you
can use a different branch name if you want.

### Previewing your work

Want to see how your post will look on the site? Just save (and commit if you
like, though it isn't necessary to build the site) and go:

```
hugo server -D
```

The `-D` option tells Hugo to include draft posts, which yours still is unless
you changed the `draft: True` line in the metadata. Follow the link in the shell
message to see your post as it will appear on the site. Most shells will let
you Ctrl+click the link to open it in the browser. If you let the process run
(you might need to open another shell window at some point, since this one will
be occupied) then subsequent changes to the site will appear as you save them
(no need to commit). To kill the server process just do a Ctrl+C in the shell
window.

### The pull-rebase-push process to upload your work to your fork

Ah, you've finished your post! Make sure you change the `draft:` field to
`False` in the post metadata up top. Likely you have a short chain of commits
from your topic branch. If you're done writing, it's time to push that branch
to `origin` and open a PR. Since we are all working on different files, it's
unlikely we'll have any conflicts. Still, you should follow the standard
process:

```
git checkout main
git pull upstream main
git checkout my-first-post
git rebase main
git push origin my-first-post
```

Then visit your fork on GitHub and open a PR. I'll merge your post into the
production site and we'll watch it grow!

### After your PR is accepted

Normally, I think best practice is not to submit a PR until the work is truly
finished—to the best of your understanding. If it turns out you need to return
to it, you can keep using the same branch. Often folks will delete their topic
branch after a PR is merged. If you delete yours, you can just create a new one
from a freshly pulled main branch if you later want to update your post.
