# Wireless Linux
## 2005/03/22 08:00

Another of those message-in-a-bottle-to-my-future-self posts.
If you are interested in a Wireless-Broadband setup, stick around,
there may be something of interest to you.

So I'm typing this while squatting on the floor in Kate's bedroom (Kate is sick so shes still asleep in bed but could wake up any minute). Its 2005 and I'm finally on wireless broadband. For someone who has been using dialup over a 56K modem for the past couple of years, the notion of being able to 'ping google' while squatting on an upstairs bedroom floor with nary a cable in sight seems like science fiction. You've heard this from anyone who has ever tried wireless: It really is mind blowing. 

I've become attached to Slackware 10.0 in a way I haven't been
attached to any previous linux Distro. I never warmed to RedHat - it
always seemed to be trying too hard not be be too unix-like. Slackware
feels more like a Unix system without being too much of a bitch to
work with. In fact slackware works just fine which is all I want
really. Lacking the bleeding edge kernels and drivers of other
distributions, its not exactly cool (if Alan Partridge used Linux it
would probably be Slackware - if only because of the name). When I
decided to sign up for broadband, I knew I would want to go wireless
so I ponied up for a <a
href="http://www.komplett.ie/k/ki.asp?sku=120184">wireless USB
dongle</a> and a <a
href="http://www.komplett.ie/k/ki.asp?sku=121748">wireless router</a>,
I downloaded the driver for the USB dongle <a
href="http://at76c503a.berlios.de/">here</a> (the driver comes as a
CVS snapshot tarball. Unzip it, set $CVSROOT to point to the unzipped
directory, then 'cvs checkout').

The driver didn't work at first so I had to modify file
at76c505-rfmd2958.c by adding the 2nd line below.

    #define PRODUCT_ID_CNET_CNUSB611G 0x0013 /* CNet CNUSB 611G */
    #define PRODUCT_ID_CNET_CNUSB611B 0x13 /* Walter's dongle */

A recompile and reboot and everything went fine. Weird because I
thought 0x0013 and 0x13 were equal. This is definitely going to deter
non-technical linux users. Whenever I hear linux geeks flippantly say
"just recompile the kernel" I go nuts. They say it like it's something
any pleb could do and not fuck up - well it isn't because this pleb
has tried a couple of times and repeatedly fucked up. Until distros
come with a big red 'recompile kernel' button on the desktop that
#just works* I'm not touching that shit again.


Slackware 10.0 doesn't come with [Wireless
Tools](http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html)
so you'll need to install that too. Once you have your wireless device
showing up in 'dmesg' output (as 'registered wlan0) put the following
code in your /etc/rc.d/rc.local file 

    /usr/local/sbin/iwconfig wlan0 essid "off" mode Managed
    /sbin/ifconfig wlan0 10.0.0.103
    /sbin/route add default gw 10.0.0.1

Now onto wireless router setup. The SMC wireless router has an IP
address of 192.168.2.1 by default. I needed to change this once my
Broadband modem arrived because it's IP address was 192.168.1.1. I
duly changed the wireless routers IP address (using the router's web
interface) to 10.0.0.1 so there would be no network conflicts.


I decided to go with a separate wireless-router and broadband-modem
because I perefer a more modular approach than using a combined
wireless-broadband-router. In my case this turned out to be a
sensible decision because once I had the windows box and linux laptop
setup for wireless I only had to add DNS addresses to
/etc/resolv.conf on the linux box once the broadband-modem
arrived.The wireless router's web-based interface has a page for
setting up PPPoE (PPP over Ethernet) connections for the
Broadband-modem. This basically meant I never had to connect the
modem directly to the linux box (or windows box). I just connected it
via an ethernet cable to the back of the wireless router and
configured the broadband connection using firefox on linux. A quick
call to Esat/BT's broadband customer support people (to get my userid
and password, which I'd forgotten and to get the DNS addresses) and I
was sorted. Well not quite. The wireless-router arrived a couple of
days before the broadband modem. While my laptop could see the router
and the Windows PC (because they were all on the same local network),
I hadn't bothered telling linux that the router (10.0.0.1) was also a
gateway.  This caused a bit of trouble when the modem arrived because
I couldn't access the modem's web interface (http://192.168.1.1) to
change it's mode of operation to 'bridging' (tells the modem that
there is an external router). Issuing the following command...

    route add default gw 10.0.0.1

...fixed the problem and I could now access the modem's web
interface. The other bottleneck was I that I kept foolishly trying to
ping 192.168.1.1 after the broadband connection had been
established. A ping of www.google.com (assuming you have DNS setup
correctly) is a much better test of connectivity.

All in all the experience wasn't as painful or frustrating as I'd
imagined. the wireless setup took about an hour and the broadband
setup took 2 hours (due mainly to my own stubborn-ness in trying to
ping the wrong IP address for the modem). I'm quite happy that I now
have a working wirelss linux laptop and I didn't have to wipe
slackware and install Win2k just to use broadband. This Linux stuff
needs some hand-holding though. The win2k wireless install was
smoother (well they do provide drivers) and for windows (because it
uses DHCP - so no mucking about with manual settings for IP address,
gateway adresses and DNS addresses) the transition from wireless to
wireless-broadband was seamless. If anyone out there knows how to set
up a wireless interface (wlan0) to use DHCP (for DNS too) on linux,
leave a comment.

<div class="update">Update: 2005/03/23 08:27</br>
I got a bad case of buyer's regret after purchasing the wireless USB
dongle. The problem with all usb dongles and laptops is that they're
flimsy and they tend to break off or get bent while lugging a laptop
around or even having it sitting on your lap (my usb port is at the
back of the machine, this wouldn't be such a problem for side
ports). So I purchased a <a
href="http://www.komplett.ie/k/ki.asp?sku=301534">CNet Wireless-G
CardBus 54 Mbps 802.11g</a> too. The <a
href="http://www.ralink.com.tw/supp-1.htm">RALink linux drivers</a>
were harder to build and install and aren't as well
documented. Setting this card up was definitely a lot more frustrating
than setting up the USB dongle. I suspect either the driver or the
hardware is flaky because sometimes the LEDs on the card just don't
come on and sometimes the wireless connection drops for up to a
minute. Even my wife (who doesn't do heavy surfing) noticed this card
was slower. This PCMCIA card is a temperamental beast. I'll try the
alternative driver <a
href="http://rt2x00.serialmonkey.com/wiki/index.php/Main_Page">here</a>. If
that doesn't improve things then the hardware is probably crap.
</div>

<div class="update">2005/04/14 09:25<br/>
So after a second bout of buyer's regret - the CNET PCMCIA card was
working but it would just stop randomly for up to 2 to 3 minutes then
start again - I went and bought a NetGear Wireless-B MA411 PCMCIA
adapter on <a href="http://www.ebay.com/">Ebay</a>. These are old
cards - you probably can't get them in the shops any longer - and they
don't support the faster wireless-G, but they work a treat. I'm very
happy with this card, so much so that I think I'll buy another as
backup.</div>

## Categories
Linux, WiFi
