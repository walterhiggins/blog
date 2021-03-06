# Replacing Text In Multiple Files
## 2012/03/26 12:54

## Problem 

You have a bunch of files and you need to change text in them. You know 
the text you need to change and what you want to change it to and you'd 
like to do this change with as little effort as possible. 

## Solution
This is a (rather long) one line unix command which should work. Hint: replace {OLD} and {NEW} with the text you want to change and its replacement text...

    find . | xargs grep '{OLD}' | cut -d':' -f1 | perl -nle '@c=`cat $_`; map{s|{OLD}|{NEW}|g}@c; open FH, ">$_"; print FH @c; close FH;'

... let's break it down. The first part of the command...

    find . | xargs grep '{OLD}' | cut -d':' -f1 

... will give a list of all files which contain the text you want to 
replace. This is necessary because you only want to change files which 
have the text you're searching for. The second half of the command ...

    perl -nle '@c=`cat $_`;map{s|{OLD}|{NEW}|g}@c;open FH, ">$_";print FH @c;close FH;'

...passes the output from the first through some perl statements which 
slurp in each matching file's contents, replace the old with new and 
blasts the changed contents back out to the file. If you're uneasy about 
mass-replacing text in a bunch of files (you should be), you can blast 
them out to staging files and then eyeball the changed files before 
committing the changes...

    find . | xargs grep '{OLD}' | cut -d':' -f1 | perl -nle '@c=`cat $_`;map{s|{OLD}|{NEW}|g}@c;open FH, ">$_.changed";print FH @c;close FH;'
    
The command above is exactly like the first except the output is to the 
file with a `.changed` suffix. You can find the files which have changed 
easily enough...

    find . -name '*.changed'

...and once you're happy the changed files are OK, commit the changes 
like this...

    find . -name '*.changed' | perl -nle ' ($o)=$_=~/(.*)\.changed$/; `mv $_ $o` '

My gut is screaming at me that there is a more elegant, concise way to do this in Unix. In particular, the last 3 perl statements...

    open FH, ">$_";
    print FH @c; 
    close FH;

... can probably be reduced to a single statement. I'd love to know if there's a better way.

## Categories
Unix, Perl