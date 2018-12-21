# Not invented here

## 2005/08/10 05:00

I suffer from a peculiar strain of egomania which occasionaly leads me 
to reinventing wheels. Said wheels usually aren't quite round and on 
mature reflection are often - how shall I say - naive, but the whole 
point of such exercises is in the joy of programming and getting a 
better understanding of how things work. My most recent hacking has been 
a make-like tool in Perl. Why would I want to write such a thing ? - 
because anything is better than [Ant][] (see footnote).

I have enormous admiration for [make][], a tool
written by Richard Stallman who also wrote Emacs.  Make, like Emacs,
is one of those programs which current software development couldn't
do without.  It's one of those unsung heroic feats of programming.  I
wanted to have a go at the problem myself to see what kind of hash I'd
make of it.  Managing dependancies is one of those fundamental
problems that come up time and time again - whether building software
using linkers and compilers or rebuilding a website using a
combination of templates and databases. Any sufficiently large system
(e.g. a website with hundreds or thousands of posts and many
templates) will eventually need some kind of make-like tool so that
when a single file gets updated, the entire project doesn't need to be
rebuilt - only those components which depend on the changed file. The
core principle is laziness - the computer shouldn't do more than it
absolutely has to.

I know there are already plenty of perl based make tools (Cons looks
impressive) but there is one problem common to all of them - I didn't
write them.  Where's the fun in using someone else's well documented,
reliable and mature code when you can write your own ? Obviously this
point-of-view isn't a luxury I can afford in my day job, only when
hacking in my spare time.

I'm not going to make any bold claims about what I've done except to
say that it works surprisingly well although the syntax can be tricky
(even for me and I wrote it). I would never contemplate foisting this
thing upon the public domain - in its current form it would likely
cause more harm than good. I just thought it would be really cool to
combine the declarative language of make/Ant with the procedural
smarts of perl. Having been exposed to both make and Ant over the
years I found myself leaning more towards make in the design (if you
could call it that) of the makefile. People bitch about make's syntax
and often laud Ant as a better make (I've been guilty of this
myself). Attempting to write such a tool gives you an insight into
just how difficult these problems are. Once you've mastered the
dependancy management and have gotten to a point where the computer
can successfully construct a dependency tree and figure out which
targets are out of date, you then have the problem of representation -
the UI for lack of a better word.  How do you create a human
readable/writable way of declaring dependancy trees. This is the
really hard part and in this respect I've just stayed as close as
possible to make and avoided Ant's overly verbose XML
representation. As egomaniacal as I am, I know I'm not smart enough to
tackle the problem of creating a better makefile syntax.
Anyway, I'm now using this build tool to upate the website and I can
tell you it makes a huge difference in speed.  Previously I had a
script which was updating every single page whenever a new post went
up (I know I know - I should use wordpress or some other standard
blogging tool, but didn't you read the title ?). Know only the 3 files
(main index, topic index and post page) get updated and the update
happens in no time at all.  

## Update 2005/08/11

WOW talk about coincidence. Martin Fowler has just posted
an excellent article on using rake - a ruby based make tool. It's main
strength he says is that it's an internal DSL (domain specific
language) which means it combines the declarative form of traditional
build tools like ANT and make, but can lean on the procedural power of
ruby when it has to. Based on Fowler's trivially simple example here
is a makefile using my own Aardvark perl module...

    use strict;
    use Aardvark;
    my $proj = new Aardvark();
    $proj->task("default: test");
    $proj->task("test: compile dataload",
                sub{
                  print "testing...\n";
                  # do some testing
                  qx(touch test);
                });
    $proj->task("codegen: datadict.spec",
                sub{
                  print "generating code...\n";
                  # do code generation
                  qx(touch codegen);
                });
    $proj->task("compile: codegen",
                sub{
                  print "compiling code...\n";
                  # do compilation
                  qx(touch compile);
                });
    $proj->task("dataload: codegen",
                sub{
                  print "loading data...\n";
                  # do data loading
                  qx(touch dataload);
                });
    $proj->task("clean: ",
                "rm codegen compile dataload"
               );
    $proj->make(@ARGV);

[Fowler's article on Rake][rake] is well worth reading if you're even 
slightly interested in how software gets built.

## footnote: 2011/10/06

What can I say - I was young and full of vinegar 
and piss. Ant has stood the test of time while my own half-baked 
Aardvark module was rapidly replaced by [TinyMake][]. I use Ant in my 
day-job today.

[make]: http://www.gnu.org/software/make/make.html

[Ant]: http://ant.apache.org/

[TinyMake]: http://search.cpan.org/~walterh/TinyMake-0.06/TinyMake.pm

[rake]: http://martinfowler.com/articles/rake.html

## Categories

Perl, Ruby, Rake, Make
