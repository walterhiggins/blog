# How to make breakfast using TinyMake
## 2005/08/18 20:00

TinyMake is a tiny make utility written in Perl. It supports both
file-based tasks (ala make) and non-file-based tasks (ala Ant). If
that sentence means nothing to you - don't be discouraged - please
read on. I thought the best way of illustrating TinyMake's
dependency-based programming model would be to create a TinyMake
script to make breakfast.

Breakfast is one of those simple concepts anyone can understand - unlike say the myriad steps 
required to compile and link a C executable, everyone (one would hope) can grasp the idea of making
breakfast. It doesn't take a rocket-scientist to break down the job of making breakfast into sub-tasks.
For this hypothetical breakfast will be making an omelette. Making an omelete for breakfast is easy,
just break a few eggs into a bowl, add some pepper, whisk, fry and serve. What could be simpler ?

Well I'm about to make this simple task quite complicated because in my kitchen I have a hypothetical production 
line of servile robots. The only problem is these servile robots don't understand voice commands. They
only understand perl code so I need to write a perl script to tell them how to make an omelette. 
I could just make breakfast for myself but the servile robots cost a lot of money and I need to feel
like I'm getting my money's worth so out pops the laptop, I fire up
Emacs and start typing...

> Making an omelete for breakfast is easy,just break a few eggs into a
> bowl, add some pepper, whisk, fry and serve

The sentence above could be turned into the following list...

 1. break eggs
 2. add pepper
 3. whisk
 4. fry omelette
 5. serve

...It's by no means a complete list. They're pedantic bastards, these
servile robots, and I'm sure they'd choke if I fed them these
instructions, but it's enough to get started with. 

... some time later ...

Well that didn't go well. The pedantic idiots cracked eggs all over the floor and kitchen table. 
You'd think they'd have enough common sense to go fetch a bowl first. Here's an updated list...

 1. *fetch bowl !*
 2. break eggs
 3. add pepper
 4. whisk
 5. fry omelette
 6. serve

Now I need to start categorizing the tasks. There are 3 distinct
phases to an omelette breakfast...


 1. Preparation
 2. Cooking
 3. Serving

and because the robots work like a production line, their task
breakdown looks like this...


    BREAKFAST
         PREPARE
                FETCH_BOWL
                BREAK_EGGS
                ADD_PEPPER
                WHISK
         FRY 
	            
         SERVE

This is how it looks to the supervisor robot who doles out tasks to
the other robots. The fellow told to BREAK_EGGS must be told the he
can't do so until the bowl has been fetched. Similarly, whoever is
told to ADD_PEPPER must be told explicitly that he can't do so until
the bowl has been fetched. The fellow told to WHISK must also be told
not to do so until eggs have been broken and pepper added. And so on.
By now you should be getting an idea of just how fanciful the idea of
'Artificial Intelligence' is. If you are a chef - rest assured - your
job is safe for some decades to come.  In short the production line of
robots must be told explicity ...


 1. What to do
 2. and what must be done (by themselves or another robot) before they can begin their task

All of the robots should be singing from the same hymn sheet or chaos
will ensue.Here is that hymn sheet - a file called 'make.pl'...


    #!/usr/bin/perl
    use TinyMake ':all';
    use strict;
    file breakfast => ["prepare","fry","serve"];
    file  add_pepper => ["fetch_bowl"], sub { 
      print "Adding pepper...\n" 
    };
    file serve => ["fry"], sub { 
      print "Breakfast is served !\n" 
    };
    file break_eggs => ["fetch_bowl"], sub { 
      print "Breaking eggs...\n" 
    };
    file fetch_bowl => sub { 
      print "Fetching bowl...\n" 
    };
    my $prepare = ["break_eggs","add_pepper","whisk"];
    file fry => $prepare, sub { 
      print "Frying omelette...\n" 
    };
    file prepare => $prepare;
    file whisk => ["add_pepper", "break_eggs"], sub { 
      print "Whisking ...\n" 
    };
    make @ARGV;

This may look strange at first. You can basically ignore the first 3-4
lines of code - it's boilerplate perl stuff. The first command in this
file is 'synonym' - this basically says 'when I say do X I mean do Y
and Z'. synonyms are how managers/supervisors dole out seemingly
trivial tasks that turn into complex life-devouring monsters. So the
first command says 'breakfast' is a synonym/alias or codeword for
'prepare', 'fry' and 'serve'. The second command is something much
meatier - a 'file' - a call to file is like a subroutine or
function. The body of the task - the perl code that does the actual
heavy lifting - is enclosed in {} curly braces.  The name of the task
appears after the curly braces followed by a '=>' and a list of other
tasks which must be performed before this task can be performed. So
the second command says 'here is how to "add_pepper" but only do so if
"fetch_bowl" is done'. The rest of the file consists of similar
commands. The 'fetch_bowl' task is interesting because it doesn't
depend on any other tasks. The only other interesting command is 'make
@ARGV'. This tells TinyMake to go ahead and make something - whatever
the user specified on the command line. The previous commands can be
thought of as instructions or blueprints, the 'make' command says -
'now go do something!'

    $ ./make.pl breakfast

Would perform the 'breakfast' task which would result in TinyMake
drilling down into each subtask and performing each task in turn until 'breakfast' was made.

    Fetching bowl...
    Breaking eggs...
    Adding pepper...
    Whisking ...
    Frying omelette...
    Breakfast is served !

    $ ./make.pl 'prepare'

Would perform all of the steps needed to prepare breakfast but would
stop short of frying and serving said breakfast.

    Fetching bowl...
    Breaking eggs...
    Adding pepper...
    Whisking ...

If I type './make.pl' then the first command in the the script will be
the 'default', so TinyMake will try to make 'breakfast' as it's the
first synonym or task that appears in the script. Notice that the
script does the right thing each time - a bowl is fetched (just once -
even though it is stipulated twice as a requirement by both the
"break_eggs" and "add_pepper" tasks), eggs are broken and everything
happens in the correct sequence each time. This has nothing to do with
the order in which the tasks are declared and has everything to do
with the right-hand-side of each command. The right-hand-side (the
part of the command to the right of '}' is where the program's brains
are. The left hand side of each command says 'What' to do while the
right hand side says 'When' to do it.

This is all fine but if I type './make.pl breakfast' many times the
script will just keep making 'breakfast' for me.  Breakfast may be the
most important meal of the day but more than one omelette in any given
day is asking for all kinds of trouble. Let's say we want to build
some extra intelligence into the hypothetical robots so that they will
only make breakfast once and once only, refusing point-blank to make
it a second or subsequent time. In order to do this the robots would
need to have some kind of memory of what they have done, each time a
task was performed they would have to 'file' it away somewhere for
recall later...


    #!/usr/bin/perl
    use TinyMake ':all';
    use strict;
    file breakfast  => ["prepare","fry","serve"];
    file add_pepper => ["fetch_bowl"], sub { 
      print "Adding pepper...\n"; 
      sh "touch $target";
    };
    file serve => ["fry"], sub { 
      print "Breakfast is served !\n"; 
      sh "touch $target"; 
    } ;
    file break_eggs => ["fetch_bowl"], sub { 
      print "Breaking eggs...\n"; 
      sh "touch $target";
    };
    file fetch_bowl => sub { 
      print "Fetching bowl...\n" ; 
      sh "touch $target"; 
    };
    #
    # shouldn't have file tasks dependant on synonyms !!!
    #
    #file { print "Frying omelette...\n"; `touch $target` } fry => "prepare";
    #
    my $prepare = ["break_eggs","add_pepper","whisk"];
    file fry => $prepare, sub { 
      print "Frying omelette...\n"; 
      sh "touch $target"; 
    } ;
    file prepare => ["break_eggs","add_pepper","whisk"];
    file whisk => ["add_pepper", "break_eggs"], sub{ 
      print "Whisking ...\n"; 
      sh "touch $target";
    };
    make @ARGV;


This looks slightly different. The 'file' command says file the result
of this task away somewhere so we don't needlessly repeat it the next
time the script is run. Now when you type './make.pl breakfast' the commands to make breakfast will be executed. But if you type './make.pl breakfast'
a second time you get the following response...

    'breakfast' is up to date

This is the computer's polite way of saying you are too fat. So now
'breakfast' will be made once and once only - forever. We've gone from
one extreme (too many fry-ups) to another (just one fry-up -
ever!). What if there was a way we could tell the computer to make a
new breakfast ? The robots would be disinclined to do so since they
can plainly see the artifacts of breakfast around them - pepper, a
bowl, a greasy dish and pan. We need to be able to  tell them to tidy
up so they can start all over again. We will do this by adding a new
task called 'tidy_up'...

    #!/usr/bin/perl
    use TinyMake ':all';
    use strict;
    file breakfast => ["prepare","fry","serve"];
    file add_pepper => ["fetch_bowl"], sub { 
      print "Adding pepper...\n"; 
      sh "touch $target"; 
    };
    file serve => ["fry"], sub { 
      print "Breakfast is served !\n"; 
      sh "touch $target";
    };
    file break_eggs => ["fetch_bowl"], sub { 
      print "Breaking eggs...\n"; 
      sh "touch $target"; 
    };
    file fetch_bowl => sub { 
      print "Fetching bowl...\n" ;
      sh "touch $target";
    };
    my $prepare = ["break_eggs","add_pepper","whisk"];
    file fry => $prepare, sub { 
      print "Frying omelette...\n"; 
      sh "touch $target";
    };
    file prepare => $prepare;
    file whisk => ["add_pepper", "break_eggs"], sub { 
      print "Whisking ...\n"; 
      sh "touch $target";
    };
    file tidy_up => sub { 
      print "Tidying up.\n"; 
      sh "rm add_pepper serve break_eggs fetch_bowl fry whisk";
    };
    make @ARGV;
    
Now when you type './make.pl tidy_up' all of the clutter gets removed
and breakfast can once again be made. 

Now here is something interesting: if I type './make.pl break_eggs'
the following output appears...


    Fetching bowl...
    Breaking eggs...


...then if I type './make.pl whisk' the following output appears...

    Adding pepper...
    Whisking ...

The computer seems to know that the bowl was fetched and eggs were
already broken. It knows this because of the extra perl commands which
we added to the task's body - specifically `touch $target`. This tells
the computer to create a file with the same name as the task. What in
effect this means is that you can make 'breakfast' incrementally and
not have to worry about duplicating effort. One of the robots breaks
down - not a problem - another robot will pick up the slack and start
off where the last one finished.

TinyMake is useful for making lots of things - not just hypothetical
breakfasts. This type of programming is called dependancy-based
programming and is the model used for creating software distributions
on CDROMs and by software developers when building and testing large
software projects. TinyMake can also be used for rebuilding or
reindexing websites or anything that needs indexing. I use TinyMake to
rebuild xanadb.com. TinyMake is available [on
CPAN](http://search.cpan.org/~walterh/).

## Categories
Perl, TinyMake, CPAN
