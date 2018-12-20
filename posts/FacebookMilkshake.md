# Facebook Drinks Your Milkshake
# 2012/03/15 08:05

> How did facebook.com/nike become a more desirable property than nike.com?  
> -- [Twitter / @walter](https://twitter.com/walter/status/179915413117878272)

Everytime I see a facebook URL in print or other physical media I have 
to ask myself - who benefits more - Facebook.com or the big-name brand 
name that appears after the forward-slash? Let's be clear here, when 
big-name brands use their Facebook page in physical promotion materials 
they are bringing into the real physical world, their endorsement of 
Facebook and seem happy that their own brand name is merely an adjunct 
to the facebook.com domain. When I see a Nike poster or print ad with 
the Facebook logo and the URL _http://facebook.com/nike_ I see an 
endorsement of Facebook by Nike - Is this really what Nike should be 
spending their advertising budget on? I don't work in Marketing but 
isn't this what Marketing types call 'Brand Dilution'?

Joe Drumgoole echoes what must now be the accepted wisdom among 
marketing people with regard to Facebook...

> @walter easier to sell in a city (Facebook) than an island (Nike.com)  
> -- [Twitter / @jdrumgoole](https://twitter.com/jdrumgoole/status/179921499615010817)

... which is fair enough. If I were a big brand though - I would have a 
Facebook presence but I would not make it so pivotal that it becomes 
incorporated in atoms and committed to physical media. The Facebook 
presence would be an adjunct to the brand's existing online presence, 
not the other way around. Think about it this way - If you're a manager 
at Nike tasked with promoting the company's Facebook presence, which of 
these two URLs looks better?
 
 1. http://facebook.com/nike
 2. http://nike.com/facebook 

They are both the same length and consist of the exact same characters - 
just in a different order. I know I'd pick the latter because it gives 
more prominence to the Nike brand/domain and clearly signals that 
Facebook is an adjunct. "But that URL doesn't go to Facebook.com!" you 
say. Well through the magic of `mod_rewrite` and a simple line of code 
in your web server's configuration you can make it so.

    RewriteEngine On
    # Redirect visitors from <your-website>/facebook to facebook.com/<your-brand>
    RewriteRule ^facebook$  http://facebook.com/nike

Now visitors to [http://nike.com/facebook][2] would automatically land 
on [http://facebook.com/nike][1] instead of getting a stupid 404 page 
not found error. Seriously Nike, with all of the money you're making 
from exploiting cheap 3rd world labor, you can probably afford to spend 
a little bit more on establishing a professional web presence.

## Qui Bono?

Who benefits from the widespread bone-headed dissemination of Facebook's 
logo and domain in physical media? Facebook of course, with a little 
kick-back to the brands doing the (literal) heavy lifting. It's a strange 
symbiotic relationship between big-name brands and Facebook and I am 
more than a little in awe of the genius of Zuckerberg and Facebook, but 
if I were a marketing exec at a big name brand pushing out physical 
materials with the Facebook logo on it, I'd be a little nervous. 
Facebook is drinking your marketing budget milkshake.

[Video: I drink your milkshake](http://youtu.be/5nQ9YQt7N8s)

## Related
[Put Your Taproot Into the Independent Web | John Battelle's Search Blog][3]

## Categories
Facebook, Milkshake

[1]: http://facebook.com/nike
[2]: http://www.nike.com/facebook
[3]: http://battellemedia.com/archives/2012/01/put-your-taproot-into-the-independent-web.php
