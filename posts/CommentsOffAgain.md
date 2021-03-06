# Turning Comments Off (Again)
## 2012/03/01 13:18

The Disqus experiment hasn't worked out. I just ran [YSlow][] on my blog 
and Disqus is really killing performance. Disqus adds 8 additional 
Javascript requests, three of which are to:

* http://edge.quantserve.com/quant.js
* http://b.scorecardresearch.com/beacon.js
* http://www.google-analytics.com/ga.js 

I'm not sure why Disqus adds these javascript requests to my blog but I 
do not like it. It also adds 3 iframes, 2 additional CSS requests, 5 CSS 
images, 1 image and 1 font. And that's on a page which doesn't have any 
comments. I've noticed pages load more slowly since I turned on Disqus 
comments so I 'm turning them off again. If you want to get in touch 
about something I've blogged, you can contact me on twitter, my username 
is [walter][] or email walter dot higgins at gmail dot com.

Social Media cruft (Twitter and Facebook widgets especially) are killing 
blog performance but bloggers seem to be locked in a fatal embrace with 
social media widgets. Over on Matt Gemmell's blog he talks about why he 
moved to OctoPress (a blogging system which creates static blog pages)...

> Despite using various caching plugins (WP-supercache, W3 Total Cache, 
> DBCache Reloaded), the site still became very unresponsive during the 
> several fireballs I've had.  
> -- [Blogging With Octopress - Matt Gemmell][mg]

Despite using OctoPress, that very page still seems unresponsive. It 
takes several seconds to load because Matt is using Facebook & Twitter 
widgets which slow down the page load. OctoPress is what the smart 
bloggers are using these days to create fast baked weblogs. But using 
OctoPress to create fast static blog posts then saddling those blog 
posts with social media widgets means you lose the performance gain you 
got from using OctoPress in the first place. If you really want a fast, 
responsive weblog you have to go cold turkey on those beloved social 
media widgets. Run [YSlow][] to see just how much payload each of those 
innocuous snippets of javascript widget code bring down from various 
CDNs and partner sites when your blog page is loaded. The results might 
surprise you. 
 
[mg]: http://mattgemmell.com/2011/09/12/blogging-with-octopress/
[YSlow]: http://developer.yahoo.com/yslow/
[walter]: https://twitter.com/walter

## Categories
Comments
