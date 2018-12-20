# How to Blog a Tweet: Part I

## 2011/10/15 09:08

I'm big on the idea of graceful degradation but I don't think the web 
designers who espouse it go far enough. For me graceful degradation 
means your content should degrade gracefully even if there isn't a 
browser present. Ridiculous I know but bear with me. 

From what I can tell, there is no consistent way to blog a tweet - that 
is - to somewhat faithfully represent a single Twitter status update in 
a blog post. I've seen screenshots used but that's not ideal (the 
content of the tweet is not accessible for one thing). I've been 
thinking about this from the point of view of someone who uses Markdown 
for blogging and who *hates* resorting to HTML (even though Markdown 
lets you do that). One of the things I *loved* about posterous was its 
bookmarklet that let you select a section of text from a webpage and 
then just by clicking the bookmarklet you could create a blog post with 
a link to the page and the selected text as a block-quote. Really neat. 

I plan to eventually add something like that for this blog but in the 
meantime I'm using my own [Markdown link bookmarklet][2] and [Markdown 
Textarea][3] to streamline my blogging process. Using these tools today, 
this is how I would blog a tweet.

 1. Visit the tweet page e.g. http://twitter.com/#!/dwlz/status/124688218061946880
 2. Select the tweet text and copy it.
 3. Go to my own (private) new post page and paste it into my markdown-enabled textarea.
 4. Go back to the tweet page and click the markdown bookmarklet. Copy the link text presented by the bookmarklet.
 5. Paste the link text at the end of the tweet text.
 6. I select the text and link and press the *Quote* button to indicate the text will appear in `<blockquote>`s.
Now my text looks like this...
    > A million guys walk in to a Silicon Valley bar. None of them buy 
    > anything. The bar is declared a rousing success.  
    > [Twitter / @dwlz: A million guys walk in to ...](http://twitter.com/#!/dwlz/status/124688218061946880)

... Those `>` arrows are a convention borrowed from email and newsgroups 
(remember those?). After Markdown has done its thing, it should look like this...

> A million guys walk in to a Silicon Valley bar. None of them buy 
> anything. The bar is declared a rousing success.  
> [Twitter / @dwlz: A million guys walk in to ...][1]

Not bad, but not not exactly faithful to twitter's UI. There is no way 
you could tell this was a tweet. One of the most identifiable things 
about twitter is its use of Avatars. No twitter status update should be 
cited without the user's avatar. The above blockquote is *semantically 
correct but visually lacking*. I plan on fixing that without sacrificing 
source readability. 

Getting back to my original point about graceful degradation. I believe 
the markdown text above should be enough to convey that the text is 
being quoted from another source. It provides the quoted text and a link 
to the original source. What I plan to do is enhance the presentation so 
that the twitter user's avatar is also included in the blockquote so 
that it is more apparent that it's a tweet and not just any old webpage citation.

Markdown doesn't know about Twitter or tweets - it comes from a time 
before twitter. It doesn't know about youtube or bandcamp or any of the 
other `<iframe>`able services and yet I can cleanly add youtube embedded 
videos without sacrificing markdown readability (see my [Hogwarts in 
Minecraft][4] post for example). This is achieved through the use of a 
simple perl script that preprocesses the markdown text *before* passing it 
on to markdown. It does things like detect youtube links and replace 
them with embedded videos and it also converts my beloved [Org-Mode][5] 
headings to markdown headings. These are examples of [Progressive 
Enhancements][6] of markdown - call it Markdown++ (I'm sure someone 
already has done this many times over). The plan is to progressively 
enhance the text above so that it more closely resembles what you would 
see on Twitter. I plan to show that in Part II. I could do the 
progressive enhancement in Javascript but I want to avoid that for now 
because I want to keep the pages as static as possible. [Bake, Don't 
Fry][7] and all that.

[1]: http://twitter.com/#!/dwlz/status/124688218061946880
[2]: http://walterhiggins.net/blog/A-Markdown-Link-Bookmarklet.html
[3]: http://walterhiggins.net/blog/A-Markdown-TextArea.html
[4]: http://walterhiggins.net/blog/Hogwarts-in-Minecraft.html
[5]: http://orgmode.org/
[6]: http://dev.opera.com/articles/view/graceful-degradation-progressive-enhance/
[7]: http://www.aaronsw.com/weblog/000404

## Categories
Blogging, Twitter
