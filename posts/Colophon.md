# Colophon

## 2011/10/23 11:41

## How this blog is built.

I'm a big believer in doing the least amount of work necessary. Laziness 
is a virtue which is why this blog is baked rather than fried. All pages 
are static which means they're just files in a directory that Apache 
serves as quick as it can. There is no underlying database (at least not 
of the SQL / Relational variety) and no off-the-shelf blogging software. 
I'm too much of a geek to use someone else's software for something as 
personal as a blog. 

### Writing

I write using a bastard mix of [org-mode][7] and [Markdown][3] because 
both are easy and intuitive. I love org-mode's outliner. Markdown has 
just a handful of easy-to-remember syntax rules. I use a tiny subset of 
HTML and most of the blog posts I write will either be pull-quotes from 
other blogs with some words of my own, or snippets of code. Markdown and 
specifically the markdown-enabled TextArea I wrote about a while ago are 
what I mostly use now when composing. I'm composing this right now using 
that self same [markdown text area][2]. It's important to me that the 
plain text I write when I'm composing a blog post is also readable 
because someday I may need to edit the post or move it to another 
platform (though moving to another platform now is a very remote 
possibility. I have everything I need here in this home-brew system. I 
don't miss the hair-pulling experience of writing blog posts using 
TinyMCE and other WYSIWYG html editors - all of which are broken in 
subtle ways). I have been writing HTML code for 15 years now. This blog 
is what I do in my free time - I have no desire to write HTML when I'm 
writing words. 15 years of writing HTML have taught me that words and 
HTML do not mix well.

### Building

The posts are saved as plain text, then tweaked slightly using a small 
perl script I wrote myself, then passed through markdown which spits out 
HTML. I use [TinyMake][5] to make sure that only those parts of the 
website which need to be updated get updated when something changes. 
TinyMake is like [Rake][6], only for Perl. TinyMake is 6 years old now 
and has been powering my other website [Pixenate.com][1] for many years. 
TinyMake is also at the heart of the Pixenate product and is used to 
incrementally build images from a photo-editing session. It's stable and 
mature enough for me, and hundreds of Pixenate customers. The makefile 
for the site (actually a perl script - TinyMake is an embedded 
domain-specific language) is 300 lines of commented perl code. I don't 
do perl golf. 300 lines of perl code might sound like a lot but then 
there are a lot of individual files to build - each post has its own 
page, there's the main index page, category indexes, the archive page 
and the atom feed. Adding a new post to the blog usually results in an 
incremental build which takes less than a second. A full rebuild from 
scratch can take up to 20 seconds on my windows laptop but considerably 
less on the FreeBSD server where this is hosted. That's 250+ blog posts 
and 30+ category indexes - I never need to do a full rebuild. 

### Templating

I use [TinyTemplate][4] which is my own and which has served me well for 
5 years now. I've implemented TinyTemplate in Perl and Javascript. It is 
fast, straightforward but uses `eval` so use with extreme caution. 
(hint: you wouldn't use this anywhere near user comments). 

### Why have a Colophon?

Because I'm a geek who is keenly interested in how websites and weblogs 
are built. This stuff is fascinating and you can't tell me otherwise. If 
reading about how geeks build their websites is your thing, you should 
take a look at the following...

 * [Dropbox is my publish button - Joe Hewitt](http://joehewitt.com/2011/10/03/dropbox-is-my-publish-button)
 * [prog21: Personal Programming](http://prog21.dadgum.com/77.html)
 * [Bake, Don't Fry (Aaron Swartz: The Weblog)](http://www.aaronsw.com/weblog/000404)
 * [WebMake: Welcome to WebMake](http://webmake.taint.org/)
 * [Colophon Sam Harrelson](http://www.samharrelson.com/2011/09/06/colophon/)
 * [FletcherPenney.net ~ Colophon](http://fletcherpenney.net/colophon/) 
 * [Colophon | Blog | 1976design.com](http://www.1976design.com/blog/colophon/)
 * [Antipixel | Blog | Colophon](http://antipixel.com/blog/colophon.html)
 * [rational geekery - Software & Services](http://ratgeek.com/colophon/)
 * [Jeffrey Zeldman Presents: Colophon](http://www.zeldman.com/colophon/)
 * [ongoing by Tim Bray &middot; Colophon](http://www.tbray.org/ongoing/misc/Colophon)
 * [Daring Fireball: Colophon](http://daringfireball.net/colophon/)
 * [inessential.com: New publishing system / tour of my head](http://inessential.com/2009/01/30/new_publishing_system_tour_of_my_head)
 * [inessential.com: A plea for baked weblogs](http://inessential.com/2011/03/16/a_plea_for_baked_weblogs)
 * [Blogging With Octopress - Matt Gemmell](http://mattgemmell.com/2011/09/12/blogging-with-octopress/)
 * [The Most Over-Engineered Blog Ever](https://ponyfoo.com/articles/most-over-engineered-blog-ever)

## Categories

Colophon, Blogging

[1]: http://pixenate.com
[2]: http://walterhiggins.net/blog/A-Markdown-TextArea.html
[3]: http://daringfireball.net/projects/markdown/
[4]: files/TinyTemplate.pm.txt
[5]: http://search.cpan.org/~walterh/TinyMake-0.06/TinyMake.pm
[6]: http://rake.rubyforge.org/
[7]: http://orgmode.org/