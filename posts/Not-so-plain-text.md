# Not-so-plain text

## 2011/10/04 06:03

When is plain-text not plain text? When it lives on more than one computer.
I have a problem. There is a fly in my plain-text blogging ointment. 
I've been drinking the plain-text kool-aid but cross-platform 
line-breaks have left a bitter taste. If I pull down a blog post from my 
BSD unix server to my ubuntu laptop, the lovingly-inserted double line 
breaks (two consecutive newlines) get squashed to just one line break or 
worse get turned into ^M (CR) characters which can turn this...

    That you didn't have to be incorporated and have a multi-million dollar 
    budget to establish a presence on the web. For a brief moment in time, 
    it seemed like anything was possible. Then we forgot.
    
    Shortly after the early frontiersmen of the web began settling, others joined.

... into this...

    That you didn't have to be incorporated and have a multi-million dollar^Mbudget to establish a presence on the web. For a brief moment in time,^Mit seemed like anything was possible. Then we forgot.^MShortly after the early frontiersmen of the web began settling, others joined.

... not pretty. It's 2011 and Windows, Unix (hell even different 
flavours of Unix) and Mac still can't fecking agree on what a new line 
looks like. This stuff is important. For the record, this is what each 
of the operating systems think a new line looks like... 

  * Windows: CR + LF (0a + 0d, \r\n)
  * Unix:    LF (0d, \n)
  * Mac:     CR (0a, \r)

... Filezilla on ubuntu does a poor job of handling file transfers 
between BSD and ubuntu. It collapses 2 new lines to 1 which messes up my 
markdown source. Anyone else have this problem and have a good solution? 
Ping [@walter](http://twitter.com/walter)

## Update

Shortly after posting this, Filezilla mysteriously began doing the right 
thing. Does it know I was blogging about it? I don't know if this makes 
matters worse or better.

## Categories

Plain-text, Markdown, FTP
