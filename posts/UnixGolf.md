# Unix Golf
## 2012/03/06 17:44

> Is there a word for feeling like you should have known something much 
> earlier? Because I get that feeling all the time working with Unix.  
> -- [Twitter / @walter](https://twitter.com/walter/status/177066714582880260)

So I've been getting my hands dirty with the expressive power of
`find` and `xargs` piped together when I chance upon `find` piped to
`perl -nle`. **BOOM!** Suddenly it feels like I'm mainlining
file-manipulation - like I've discovered some secret back door into batch
file processing. That combination is so powerful it feels positively
seedy :-)

To output a list of all jar files and the classes contained therein
(useful for java programmers) ...

    find . -name '*.jar' | perl -nle 'print "$_\n".`jar -tvf $_`'

... The `find . | perl -nle` combination addresses an entire class of 
tasks for which I would previously have written much longer perl 
scripts. The above command does the same thing as this [Perl script][2] 
I wrote about earlier this year. I feel slightly ashamed that I've been 
doing it wrong all these years but - hey - I've never really spent 
enough time on Unix so I won't beat myself up too much. Unix always 
makes me feel like a newbie but at least I'm still learning and that's 
good. The `find` command is also available in [CygWin][] for Windows 
which you should install if you're on Windows.

[2]: Perl-Goodies-List-contents-of-all-jar-files.html
[CygWin]: http://www.cygwin.com/

## Categories
Unix, Perl, Files
