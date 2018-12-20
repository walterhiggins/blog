# Call off the search (Slackware Linux)
## 2004/08/11 23:00

For a while now I've been watching distribution numbers edge into
double digits.

Watching and waiting because frankly I've been quite content with
Mandrake9.0 since I began using it in early 2003. I've had my eye on
Debian3.0 for a long time but have held back on buying a distribution
so I tried out Slackware 10 which comes free with this month's [Linux
Format](http://www.linuxformat.co.uk/). What actually prompted the
upgrade was ... I was in Micromail last friday and picked up an
OpenBSD 3.0 cd set for 5 euro. The plan was to wipe win2k from my
laptop altogether and dive into openBSD (sink or swim approach). That
plan didn't work so well because I was rusty with fdisk and forgot to
make my root partition bootable. There was a time when this kind of
fiddling about with MBR and disk partitions would induce palpitations
and cold sweats. Now I have to contend with Kate (who'll be 3 years
old this sunday) tapping random keys while I try to use fdisk for its
intended purpose. Unless you've used fdisk you probably won't
appreciate just how explosive a mix, fdisk and a 2-year old's random
keystrokes can be.

The upshot of these furtive-keypress-followed-by-skillful-parry
sessions with fdisk and my 2 year old daughter, is that I'm no longer
afraid of fdisk. In fact using fdisk in a cleanroom environment is a
breeze. 

Once I had figured out that slackware needs a single 3G+ / (root)
partition it was plain sailing. After install I even upgraded to
kernel 2.6.7 (in the 'testing' folder on CD #2) all from the comfort
of a console session. I tried X and a couple of window managers
(KDE3.2 on my 6-year-old 233Mhz laptop is Sloooooow but
[xfce](http://www.xfce.org) loads fast and is light and zippy) but
found I was logging out of X and spending time in the console. This is
probably a measure of how comfortable I am with emacs now. The
slackware10 install correctly configured X for my 1024x768 lcd screen
without a hitch. A nice new feature of linux is [Framebuffer
consoles](http://www.userlocal.com/tips/fbset.php). These are consoles
at full resolution (1024x768 on my laptop) so with Emacs and
Framebuffer console there is even less of a need to run X.This
distribution has a reputation for being difficult but it's
undeserved. The installer may be text-based but I found it pretty easy
and I'm hardly a power user (see any of my posts on the <a
href="http://cork.linux.ie/">clug</a> mailing list for evidence). What
I like about slackware (and I do like it a lot - It was 3am this
morning before I realized how long I'd been tinkering with it) is its
back-to-basics no-nonsense approach.


Billed as "linux as it was meant to be", Slackware 10 has none of the
watermark configurations that the major distributors (Redhat, Suse,
Mandrake etc) stamp all over their distributions. This is nice. But
slackware despite its reputation, isn't lean enough.

The only problem really is all the <a
href="http://dictionary.reference.com/search?q=cruft">cruft</a> that
comes with every linux distribution (every one I've tried
anyway). People complain about cruft building up over time in
Windows. With Linux you get all the cruft dumped on your hard disk
from day one. All I want is a distribution that lets me install
Apache, Mozilla, Gimp, Emacs, MySQL, Postgres, Perl, JDK and nothing
else. Most of the installers haven't nailed this one yet. There are
options in each installer but dependancy management is a nightmare and
most of the installers either offer prompts for every single
package/app you could think of, or a 'full install' option. Believe
me, I've tried the 'custom install' option on a few distributions (a
mind-numbingly repetitive experience) and the 'full install' option is
always the option I end up taking. Slackware10 is no excpetion to this
everything-but-the-kitchen-sink rule of linux installers. Much as I'd
like to I found myself taking the easy option and allowing the install
to dump 15 different email clients, 20 different IRC clients (I never
even use IRC) and god knows what else on my hard drive. Coming from
the days when 512MB of hard disk space seemed like an endless prairie
of virginal ferrous oxide, the thought of all those apps and libraries
I'll never use, taking up many Megabytes of storage - well - it bugs
me. It's an itch I can't scratch. 

#My god - all those files just sitting there doing nothing but taking
up space !!!*  
There are probably tablets I can take for this.  

So slackware 10 is pretty good which is to say I like it. In so far as
any linux distribution can make you feel warm and fuzzy, this one
does. You have to try a few linux distributions before you can get a
feel for what you like. Slackware feels less like a branded product
and more like linux-as-it-was-meant-to-be. Give it a spin. 

### 2004/08/12 15:43
On the 2nd Slackware CD you will find kernel2.6.7 in the 'testing'
folder. I decided to try out the 2.6.7 kernel and followed the
instructions to create an initrd.gz image for reiser Filesystems, and
added the 267 image to lilo.conf. As a result 2 things happened. 

 1. I could no longer boot the 2.4.27 image - A kernel panic occurred
 during startup.
 2. My USB port refused to work. The port and device (a compactflash
 reader) were detected but I couldn't mount them.

The solution for me was to revert back to the 2.4.27 kernel. This
actually required a reinstall as the old kernel image wouldn't boot
and I don't know enough about mkinitrd and the initrd-tree/ folder to
fix what might have been a minor problem. More importantly I know
longer have the time to dig into these problems. Since the reinstall ,
my usb flashcard shows up on /dev/sda1 and I can mount it using
<code>mount -t vfat /dev/sda1 /mnt/flashcard</code> but I'm not sure
how I should change my /etc/fstab file to automount the card.


### 2004/08/17 12:56
For all of the latest slackware packages visit <a
href="http://www.linuxpackages.net/">http://www.linuxpackages.net/</a>

## Categories
Linux

