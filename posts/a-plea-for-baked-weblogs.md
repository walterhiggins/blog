# Brent Simmons: A plea for baked weblogs

## 2012/02/15 16:40

Brent Simmons on what his ideal blogging system would be like...

> Dynamic authoring, static publishing: in this scenario, everything lives 
> on the server. You have the advantage of being able to publish from 
> anywhere you can get to a web browser. But then the server generates 
> static pages when you make a change. It's much like the first scenario, 
> except that it's accessible from everywhere.  
> -- [inessential.com: A plea for baked weblogs][1]

Brent's post is interesting. He's looking for a weblog system that
allows publishing (from a weblog admin console - so no FTP required)
to static pages. That's exactly what my home-grown, hand-rolled,
home-baked weblog system does ;-) Brent isn't a fan of storing blog
posts in a database. Neither am I. It's just too bad my system doesn't
meet Brent's other requirements for an ideal blogging system...

 * "it would probably have to be done in PHP, since PHP remains the commonly-installed scripting system on shared webservers" 
 * "It should be as easy-to-install and easy-to-use as WordPress - easier, actually, would be better."

My system is written in Perl. The makefile for incrementally building
the weblog is a meager 300 lines of perl code that uses [TinyMake][2]
and [TinyTemplate][3]. Both of these libraries are also home grown so
are probably too weird for use by anyone other than I. If the
following snippet of code weirds you out then my un-named
home-grown blogging system isn't for you...

    file  "clean"        => [],                \&clean;
    group "markdown"     => \%txt2markdown,    \&build_markdown;
    group "html_pages"   => \%markdown2page,   \&build_page;
    group "categories"   => \%hcat,            \&build_archive;
    file  "index.html"   => ["templates/index.html",   @recent_posts],   \&build_index;
    file  "archive.html" => ["templates/archive.html", "index.data", @archived_posts], \&build_archive;
    file  "atom.xml"     => ["templates/atom.xml",     @recent_posts],   \&build_atom;
    file  "all"          => [qw(categories index.data markdown index.html archive.html html_pages atom.xml)];
    
    map { make $_ } @targets ;
    
The other point is ease-of-install. Well once you have Apache
configured to support perl/CGI my system is easy to install. It's just
files on a disk, no database required. I've also decided to pretend
that `mod_rewrite` doesn't exist. I used a lot of `mod_rewrite` magic
on my old xanadb blog (it was a learning experience) but decided not
to rely on it for this iteration of the blog. The fewer external
dependencies, the better. The admin console is protected using HTTP
authentication. I've probably said too much.

Now to the sticky issue of ease-of-use. I'm not going to claim my admin 
console is easy to use. It's functional. I can create new blog posts, 
edit existing blog posts or delete them entirely. There are no advanced 
features like Previews, Drafts, and scheduled posts. This is a blogging 
system for me and I never used any of those features in Wordpress or 
Posterous. In my experience, 'Draft' blog posts tend to stay in 'Draft' 
indefinitely. Where I will make a claim to ease of use is in the use of 
a custom Markdown editor and supplemental markdown bookmarklet I use 
extensively when creating blog posts. You can see a [stripped down 
markdown editor here][4] and the [bookmarklet is here][5]. If you love 
your WYSIWYG TinyMCE editor provided by Wordpress and have never pulled 
your hair out using it, then you will look at Markdown and wonder what 
all the fuss is about. If on the other hand you have come to the 
realisation that all online WYSIWYG html editors are fundamentally, 
premature-baldingly broken, then look no further than Markdown. It will 
heal you (but won't bring your hair back - that's gone for good). I 
would be really interested in trying out the markdown editor on my 
daughter - she uses Wordpress.com. I bet, after the initial WYSIWYG 
withdrawal symptoms, she would quickly adapt to using Markdown as a 
better-than-html web authoring markup. As far as I know Brent is a 
already a fan of Markdown so if you're reading this Brent, leave a 
comment and I'll send you the code. That goes for anyone else brave 
enough to want to try out a new untested blogging tool. 

[1]: http://inessential.com/2011/03/16/a_plea_for_baked_weblogs
[2]: http://search.cpan.org/~walterh/TinyMake-0.06/TinyMake.pm
[3]: files/TinyTemplate.pm.txt 
[4]: files/markdown_textarea.html
[5]: A-Markdown-Link-Bookmarklet.html

## Categories
Blogging
