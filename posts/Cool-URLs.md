# Cool URLs
## 2012/02/29 19:23

This is Tim Berners Lee on what makes a cool URL and what you should 
leave out...

> File name extension. This is a very common one. "cgi", even ".html" is 
> something which will change. You may not be using HTML for that page in 
> 20 years time, but you might want today's links to it to still be valid.  
> -- [Hypertext Style: Cool URIs don't change.][1]

[1]: http://www.w3.org/Provider/Style/URI.html

I was searching for how to remove the filename extension and came across 
a couple of threads which suggested using mod_rewrite. I like to pretend 
`mod_rewrite` doesn't exist. It's not that I'm not familiar with it - I 
am - I just don't like to rely on it, it feels a little too much like 
magic. After a bit more digging I found [MultiViews][] so now this and 
other URLs on the blog can be accessed without the .html suffix. Which 
is pretty [Cool][]!

[MultiViews]: http://httpd.apache.org/docs/2.2/mod/core.html#options
[Cool]: Cool-URLs

## Categories
The Internet, URLs