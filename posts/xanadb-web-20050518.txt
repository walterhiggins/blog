# Turning software into money
## 2005/05/18 07:00

### An experiment...

I've been mulling over an idea for the past 24 hours. The idea was
prompted by a much bigger idea put forward to me by a fellow blogger
and former colleague for a web-based business.  My former colleague's
idea is compelling and clever and while I wish him the best of luck
with it, I doubt that I'll be able to make any meaningful
contribution, given my work commitments.  My own (much smaller, and
not half as clever) idea is something I've tried before but failed
at. Making money from web services.  This is something that's really
hard to do because noone wants to pay for web services and most of the
people writing web services (that is : developers) are all too aware
of the abundance of data swarming around the Internet. While writing a
web service may be cool, it's definitely not something one should
consider making money from, even if it could be done, the notion of
making money from web services is considered vulgar in this age of
open-source and free-as-in-beer software.

Which is where I step in. Never one to shy away from vulgarity, I'm
going to perform an experiment, to see if I can make money from a
simple web service (and by simple I mean _really simple_, so simple it
requires no programming expertise to use and so probably doesn't
qualify as a web service to web service purists).

### What is a web service?

For the purpose of this experiment, a web service is a service
provided through the use of HTTP. That's it, nothing more. A service
is something which is provided by someone other than yourself. 

For example: I want to do X but I don't know how. I have two options.

 1. I can spend some time figuring out how to do X, then do it.
 2. I can look in a directory (yellow pages, google - whatever) to
 contact and pay someone who can do X for me. 

The first option saves money, the second saves time.

I'm a programmer and must admit that I shy away from DIY at home. We
are getting our bathroom completely refurbished at the moment. We've
hired a tiler and a plumber and both are doing sterling work - work I
couldn't even begin to contemplate doing. A spirit-level is as foreign
to me, as a compiler is to a plumber. When it came to refurbishing our
bathroom there really was only one option. DIY was out of the
question. How many tasks are encountered on a daily basis, which given
the option, we would willingly pay someone else to do? How much would
we be willing to pay someone else to do said task ?

While mulling over the big idea I began to do what I always do when
posed with a big problem. I began to break it down into many small
problems. One of the small problems was of the proverbial 'low-hanging
fruit' variety. I set to work on the problem at around 10 oclock last
night and by 12 oclock I had a solution. The problem is
straight-forward and the solution is simple once you know it, but it
still required time and know-how to get there. Time and Know-how which
I hope to turn into money.

### How much should a HTTP request cost?

How much should you charge for the use of a URL? No seriously - I'm
not kidding, how much would you be willing to pay for a single
one-time-only access to a URL? You may or may not be signed up for a
payed-for online service/subscription. I know I signed up for [Motley
Fool's](http://www.fool.com) service a few years ago. It cost me about
$40 and for that I had access to the website forums and articles for a
full year. I imagine the profit Motley Fool makes from paid-up subscribers
like me, is enormous. I certainly didn't hog their bandwidth. I didn't
download gigabytes of information during my subscription. Which leads
me to my next dilemma.

I've been considering various pricing models. You see, while I'd like
to, I can't charge by the request. I just don't have the payment
technology. I use [paypal](http://paypal.com) for
buying stuff on ebay (no more - I've sworn off that) and have only
ever received one single payment (of $1) for the <a
href="/archive/perl/20030617">stock ticker web service</a> I've been
running for the past 2 years (which is why I don't have high hopes of
making a lot of money from this new service). I don't have a great
deal of flexibility in how I can charge for the web service. Here are
the options I had considered..


 1. Pay by the request (not really viable)
 2. Subscription model (pay up front for 1 years use of service)
 3. Lifetime flat fee payment
 4. Pay by bandwidth

I didn't even consider enterprise/multi-user licenses since big
companies don't rely on websites run by individuals for IT services. I
considered the subscription model, but given the type of service this
is, there could be huge disparity in usage by different users. Someone
could be using the service heavily and would only pay the same amount
as someone who uses it lightly. The lifetime flat fee payment wouldn't
be fair for the same reason. Pay by bandwidth seems to be the fairest
pricing model - you only pay for what you use. But given paypal's
limitations I still have to require an upfront payment for say 1
gigabyte of usage.

It seems that before I can figure out how much I should charge for the
web service, I should figure out how much it is going to cost me (lets
leave aside the issue of time and effort expended in writing the
service, CPU cycles expended running the service etc). Yes, web
services (as with any publicly available web resource, HTML, image
files etc) cost web site owners money. I pay my hosting provider an
annual fee to host this website. I will also pay an additional levy if
bandwidth exceeds a certain limit each month. The hosting provider is
competitively priced but it's still money out of my pocket (I'm not
running this on blogger you know).

Let's say for the sake of argument that the hosting provider charges
$4 per Gigabyte per month. And let's say that each web service
response is approx. 50 Kilobytes in size. That means that 20 URL
requests will generate 1 Megabyte of traffic.20,000 requests will
generate one Gigabyte of traffic. 20,000 requests might seem like a
high number, but when talking about web traffic, it's piddling. A-List
bloggers get more than 100,000 requests a day. This web service I'm
providing could be used from within a web page on an A-List blog, so
straight off the bat, that's 5 gigabytes of traffic in one day, 150
Gigabytes in a month - that's a whopping $600 that I (the web service
provider) would have to pay to the hosting provider each month. This
is probably a worst case (or best case depending on your point of
view) scenario. Unless, you own the web server and the colocation
space (per square inch: the most expensive real estate in the world),
a popular web service has to at least cover it's costs.

Obviously I also want to make a little profit. If it only covers it's
costs - where's the fun in that? The question then is, what kind of
profit margin should you put on a web service ? According to this
[thread on
JoelOnSoftare](http://discuss.fogcreek.com/joelonsoftware/default.asp?cmd=show&ixPost=38517),
Microsoft's profit margins are around 90%. Since this seems to be
around the same as IBM's profit margin, let's go with that. This would
mean that I should charge $7.50 ($4 + 90% ) per Gigabyte for the web
service. This certainly falls into the 'petty cash' category for most
small web companies (the target customer). Now that I've put a price
on the service, I better explain what exactly I'm selling...

### Fuzzy Faces
The web service I plan to sell is simple. It is a CGI program that
blurs a graphic image. The web service is so simple that it's best
explained by example. The web service is still in incubation at the
moment so the existing URI schema is a work-in-progress and will be
subject to change. The web service is simple - It's a URL to a dynamic
image. The image presented depends on the image URL supplied to it and
the degree of blurring required. Its a service provided via the web
that requires no programming knowledge other than HTML. If you can
write a basic web page, you can use this web service (how's that for
low barriers to entry?).

Who would use this service? Someone with a large collection of
mugshots that they want to blur for the sake of anonymity. But why
create a web service to blur images which are publicly available on
the web anyway? Isn't that self-defeating? Not if the source images
are protected using a [.htaccess](http://httpd.apache.org/docs-2.0/howto/htaccess.html)
file. Web resources can be made available to a single remote address
(in this case www.xanadb.com).

The other problem is how to stop any tom, dick or harry from using the
web service. A little bit of .htaccess tweaking on this web server
should solve that problem. Stay tuned.

## Categories
Web, Money
