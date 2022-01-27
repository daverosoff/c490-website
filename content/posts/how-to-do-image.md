---
title: "How to Do Image"
date: 2022-01-26T14:20:53-07:00
draft: false
---
## Adding images to your Hugo post

Create a new top-level folder in your site repo. By "top-level"
I mean that it should be a sibling of `archetypes` and `content`.
Name the new folder `static`. Put an image in that folder.

To link your image from a post, use code like this:
```md
![Here is frog](/frog.jpg)
```
The text in [square brackets] is the alt text that is necessary
for accessibility. Notice that we don't type `../frog.jpg` or `../../static/frog.jpg`
or anything that is so intuitive. The address is translated by Hugo's
backend into the correct thing. Here's an example:

![Here is frog](/frog.jpg)
