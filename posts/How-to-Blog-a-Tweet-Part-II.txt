# How to Blog a Tweet: Part II

## 2011/10/15 17:28

In [part I][1] I talked about the need to indicate when a quote is
from a twitter page and not just any old web page. This should be done
automatically just using regular markdown text but Markdown doesn't
(nor should it) understand twitter and so doesn't add any special
twitter-specific markup when it encounters the following markdown
text...

    > A million guys walk in to a Silicon Valley bar. None of them buy 
    > anything. The bar is declared a rousing success.  
    > [Twitter / @dwlz: A million guys walk in to ...](http://twitter.com/#!/dwlz/status/124688218061946880)

Fortunately, that URL above is rich in information. It tells me not
only that the URL is from twitter but also who tweeted it
(dwlz). Using this information I can make a call to twitter's API to
get the user's Avatar...

    http://api.twitter.com/1/users/profile_image/dwlz.json

... This particular API call can actually be used directly as the `src` 
attribute in an `<img/>` tag - Neat (update: Twitter expressly [don't 
want you to do this][2] so I've modified my code to copy the avatar to 
my blog instead). I've added some code to the markdown preprocessor that 
sniffs out twitter urls and will add the twitter user avatar to 
blockquotes and some other adjustments so the blockquote looks more like 
tweets as we know them.This is what the above markdown code looks like 
when rendered now...

> A million guys walk in to a Silicon Valley bar. None of them buy 
> anything. The bar is declared a rousing success.  
> [Twitter / @dwlz: A million guys walk in to ...](http://twitter.com/#!/dwlz/status/124688218061946880)

A big improvement on the plain vanilla blockquote in the earlier
post. The important thing is I don't have to add anything to the
markdown source to see the new twitterized blockquote.

[1]: How-to-Blog-a-Tweet-Part-I.html
[2]: https://dev.twitter.com/docs/api/1/get/users/profile_image/%3Ascreen_name

## Categories
Blogging, Twitter, Markdown
