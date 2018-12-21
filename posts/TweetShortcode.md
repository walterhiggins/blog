# Baked Embedded Tweets

## 2012/03/11 19:35

I don't know how long Twitter's new embedded tweets feature has been 
around but I just discovered it. It's a new 'Embed this Tweet' link that 
appears on a Tweet's page. I was intrigued by the Short Code link and 
its use by Wordpress so I added to my home-brew blogging system too.
[tweet https://twitter.com/walter/status/177066714582880260]
This is what the shortcode for the above Tweet looks like...

    [tweet https://twitter.com/walter/status/177066714582880260]

... it's pretty nice being able to embed tweets so easily. The shortcode 
is just one of the half-dozen add-ons to the plain vanilla Markdown I 
normally use for blogging. I'm not entirely sure I could countenance 
using the HTML embedded code as it relies on 3rd party javascript code 
to work and I really like to keep this blog baked as much as possible. 
This is an example of the snippet of HTML code Twitter suggests you 
paste into your blog...

    <blockquote class="twitter-tweet tw-align-center">
    <p>Is there a word for feeling like you should have known something much 
    earlier? Because I get that feeling all the time working with Unix.</p>
    - Walter Higgins (@walter) <a 
    href="https://twitter.com/walter/status/177066714582880260" 
    data-datetime="2012-03-06T16:22:49+00:00">March 6, 2012</a>
    </blockquote>
    <script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

... and this is what it will look like...

<blockquote class="twitter-tweet tw-align-center">
<p>Is there a word for feeling like you should have known something much 
earlier? Because I get that feeling all the time working with Unix.</p>
- Walter Higgins (@walter) <a href="https://twitter.com/walter/status/177066714582880260" data-datetime="2012-03-06T16:22:49+00:00">March 6, 2012</a>
</blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I'm surprised it's taken Twitter so long to make embedding Tweets this 
easy. It's clearly something that has been needed for a long time - how 
many times have you visited a blog over the past couple of years which 
had a screen-shot of twitter where an embedded tweet should have been?

## Bake Don't Fry

So what's the difference between Baking and Frying? Aside from some 
obvious UI differences (which can be fixed - the same data is used in 
both the Baked and Fried versions), the main difference is *when* the 
tweet gets constructed. In the Baked version (1st example), the tweet 
markup is constructed when the page is first published - it's 
constructed only once at build time and is as static as the page on 
which it is embedded. In the 2nd (Fried) version, the Tweet gets 
constructed at load time - that is - it is constructed *every single 
time* the page is viewed by someone. This can turn out to be quite 
expensive from a performance point-of-view because the page on which the 
tweet is embedded must make many requests to Twitter's API servers and 
content-delivery network, then construct the tweet using javascript. No 
prizes for guessing that Baked embedded tweets are faster than Twitter's 
default suggested HTML embed code (Fried). Of course, this is a moot 
point if you're using WordPress since your blog page won't be static 
anyway but if you are using a blogging system that generates static 
pages (either home-brew or OctoPress), being able to bake in embedded 
tweets will make your blog faster.
        
I've been on twitter since the early days when it wasn't very reliable 
so I don't like to depend on any Javascript served up by its 
infrastructure. Plus the shortcode looks so much cleaner than the HTML 
embed code. Note to self - look into what other short-codes are 
available on SoundCloud, YouTube etc.

## Related 

[Bake, Don't Fry (Aaron Swartz: The Weblog)][bdf]

## Categories
Twitter

[bdf]:http://www.aaronsw.com/weblog/000404
