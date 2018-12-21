# Pretend it doesn't exist

## 2012/03/07 11:08

Longtime blogger Jason Kottke recently redesigned [his website][ko]. 
Like many bloggers, he's added Facebook Like and Tweet buttons to every 
post. All this social media cruft has really slowed down his site. When 
even high-profile blogs like Kottke become locked in the fatal embrace 
with social media widgets, you have to wonder.

Meanwhile via [Hacker News][hn] I came across this [interesting
nugget][tw2]. A single Tweet (140 characters) page from Twitter has a
*2 Megabyte* payload! The signal to noise ratio is insane - 2 million
bytes of Javascript, HTML, CSS & Images to deliver just 280 Bytes of
information (I'm assuming twitter uses unicode - 2 bytes per
character).

> I get links to tweets by mail, etc. on a regular basis, and the 
> aggressive anti-performance and apparent contempt for the web by 
> Twitter's designers is probably the thing that gets me most irrationally 
> riled-up on a daily basis. How does this pass design review? Who looks 
> at a page this massive, this typically broken and says "go with it"?   
> -- [bandwidth (tecznotes)][tw2]

As I not only write this blog but also wrote the software which powers
this blog, things can get a little bit 'Meta' around here from time to
time. I think about how my blog should appear and work perhaps more
than is healthy for me. I think in particular about all of the things
I must leave out.  This is a list of all of the things I must pretend
don't exist in order to stay focused, sane and lean while writing
online...

  * HTML  
    If you must remember to add a `</p>` at the end of each paragraph
    when you're writing, you're doing it wrong. I use [Markdown][md] so I
    don't have to worry about HTML.

  * Javascript  
    I love Javascript. I really do. For the past couple of years I've
    been championing it to anyone who would listen. I can honestly say
    I thought Javascript was cool before everyone else did ;-) The
    [Pixenate Photo Editor][pix]'s codebase is mostly Javascript with
    a little bit of Perl on the backend. Javascript is a beautiful,
    elegant, expressive programming language I would love to spend
    more time with.
    But I don't want Javascript on my blog because I don't need it. 

  * CSS / Stylesheets  
    This one is harder to ignore. I do have a stylesheet but I'm a
    programmer not a designer so my lack of design talent is a
    built-in inhibitor to too much fretting over design.

  * [The Fold][fold]

  * Analytics  
    Not worth the performance hit. I used Google Analytics for a while
    but distrust using any 3rd-party Javascript. Also, did I
    mention performance?

  * SEO.

  * `mod_perl`  
    A performance tweak. I don't really need it as the blog is static
    anyway. `mod_perl` (and `mod_rewrite`) are both technical rabbit-holes
    I'd normally only be too happy to dive down. It's an unnecessary
    distraction.

  * `mod_rewrite`  
    A Powerful tool for webmasters but overkill for a simple static
    blog and it feels too much like magic. I dabbled with it in a past
    blogging life. 

  * Comments  
    Comments are just another one of the [mistakes we made along the 
    way][mis]. I tried Facebook comments but the payload was huge, the same 
    was true of Disqus comments with the added disadvantage they were 
    inserting analytics code too. 

  * Advertising  
    See SEO and Analytics.

  * [Techmeme][tm]  
    Not relevant in any way ever.

  * The Blogging A-List  
    This one is easy. There used to be a blogging A-List in 2003 which
    was the subject of a lot of angst amongst bloggers who weren't
    part of the A-List. This is one aspect of blogging I don't
    miss. Today even A-List bloggers don't get the love they used
    to. The field is wide open again.

  * Twitter  
    This is my one concession to social media sharing from the
    blog. Expecting my Twitter friends to read long blog posts is like
    asking a mayfly to observe Lent. People on Twitter are careening
    down the fast lane of the information superhighway. Asking them to
    change gears and switch lanes to a backwater offramp to read your
    blog won't work. I don't even share everything I post here on
    Twitter - much of it just isn't suited to Twitter.

  * Facebook  
    Funny thing is, since turning my back on Facebook I seem to write about 
    it an awful lot. Funny that. This is one area I need to improve. There's 
    a whole lot of activity going on over there in Facebookland but I chose 
    this blog for the peace and quiet, as a place where I could write longer 
    more thoughtful pieces and hopefully - over time - improve. 
  
  * Widgets  
    They just add visual clutter and slow down web pages. I'm surprised that 
    so many otherwise smart people (I'm talking about bloggers who have some 
    kind of technical background) are using them on their blogs. Don't these 
    people visit their own website or at least care a little about 
    performance? 
    
  * Visitors  
    Blogs don't have Visitors, they have Readers. Write accordingly.

What do you have left when you pretend these things don't exist? The 
best writing tools available - your mind and a text editor. [Everything 
else is noise][back].

[ko]:   http://kottke.org
[hn]:   http://news.ycombinator.com
[tw2]:  http://mike.teczno.com/notes/bandwidth.html
[mis]:  http://blog.thoughtwax.com/2011/09/mistakes-we-made-along-the-way
[fold]: http://en.wikipedia.org/wiki/Above_the_fold
[tm]:   http://techmeme.com
[pix]:  http://pixenate.com
[back]: back-to-basics.html
[md]:   http://daringfireball.net/projects/markdown/

## Categories
Blogging
