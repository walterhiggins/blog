# Recently Modified Files

## 2012/03/09 16:32

When I'm trying to track down a difficult problem I often find it useful 
to look at the log files. The question that always arises is: Which log 
files to look at? If you're working on a system with many moving parts 
and many layers of middleware it can be daunting trying to figure out 
which log files to look at. I find a useful exercise is to try to 
reproduce the problem and if successful, look at the most recently 
modified log files for clues. The question then becomes: what are the 
most recently modified log files?
 
I've found this unix command is useful for showing the log files 
modified in the last hour...

    find . -name '*.log' | perl -nle 'if(-M $_<(1/24))print $_'

This command uses perl's -M file test to get the age of the file (in 
days) since it was last modified, so the test `if (-M $_ < (1/24))` will 
be true for files less than 1 hour old. To find files modified in the 
last 2 hours, change the test to `if (-M $_ < (2/24))`. To find files 
modified in the last 1/2 hour ... `if (-M $_ < (0.5/24))` ... and so on. 
Once you have a list of recently modified log files you typically want 
to look at the last few lines of each of them...

    find . -name '*.log' | perl -nle 'if(-M $_<(1/24))print "$_\n".("="x72)."\n".`tail -10 $_`'

... prints the file name and the last 10 lines of each of the most 
recently modified log files which lets you see at a glance what went 
wrong. That command does not look pretty and I'd love to know if there's 
a shorter more elegant way to do this. Either way I hope someone else 
finds this useful.

## Categories
Unix, Files, Debugging
