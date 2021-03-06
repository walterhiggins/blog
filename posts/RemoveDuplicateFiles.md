# Remove Duplicate Files

## 2012/03/03 11:12

The following perl script will remove duplicate files if called like this...

    find . -type f -print | xargs md5sum | perl remove_dups.pl

This is the source code to remove_dups.pl

    #!/usr/bin/perl
    my %found = ();
    foreach (<STDIN>){
        my ($md5sum, $filename) = $_ =~ /(\S+)\s+(\S+)/;
        if (exists $found{$md5sum}){
            unlink $filename;
        }else{
            $found{$md5sum} = $filename;
        }
    }

## How it works

`find . -type f -print` will recursively list all of the files (and only 
files - not directories) in the current and sub-directories. Find is 
preferable to `ls -R` because it shows the full path not just the 
filename of each file.

    ./common/etc/src/xanadb.scm
    ./common/etc/src/ursulahiggins.scm
    ./common/etc/src/grid-fade.scm
    ./common/etc/src/erase-nth-rows.scm
    ./common/etc/src/tinymake.pl
    ./common/etc/src/c2.pl
    ./common/etc/src/javac.pl
     
`md5sum` generates a unique hexadecimal number for each file based on 
the file contents (not the name), so `find . -print | xargs md5sum` 
generates output like this...

    a64706500f2e04fff3f899cf2ed34a81  ./common/etc/src/xanadb.scm
    ef7f6b820bd85332da4d1ccec9ff47f3  ./common/etc/src/ursulahiggins.scm
    bcbec7e33ee5abede783f8139aa0179e  ./common/etc/src/grid-fade.scm
    62998a51fd396328ab32040aff4da957  ./common/etc/src/erase-nth-rows.scm
    f2a49e3c7c7387a9673e5b1963cb0f53  ./common/etc/src/tinymake.pl
    795fc0a4b93a53d0256ec26fc8a53f79  ./common/etc/src/c2.pl
    e35aa8e8a641f777c7ccb74ded527837  ./common/etc/src/javac.pl

The perl script splits the output for each line into name-value pairs 
(where the md5sum is the name and the filepath is the value) and 
populates a hash or deletes the file if the md5sum has already been encountered.
 
I'm pretty sure this perl could be reduced to a one-liner or perhaps 
other unix commands could be used to achieve the same thing. I'd like to 
hear if there's a better approach. I've only recently begun to fully 
appreciate the power and utility of the `find` and `xargs` combination - 
shameful given how long I've been dabbling in unix. I've been doing some 
deep-diving into `find` and `xargs` options to the point where now if I 
want to perform a set of operations on a set of files I see if there's 
some combination of find and xargs that would do the trick rather than 
writing a perl script. 

On OS X and FreeBSD, there is no `md5sum` command and the `md5` command 
reverses the order of output for each line and adds some extra 
boilerplate which needs to be stripped. There are probably `md5` options 
which will give output similar to linux's `md5sum` command.
Update: You can email or leave a comment on the [Hacker News 
thread][hn]. This is an unwieldy one-liner which does the same thing...

    find . -type f -print | xargs md5sum | perl -nle '%f;($n,$v)=$_=~/(\S+)\s+(\S+)/;if($f{$n}){unlink $v}else{$f{$n}=$v}'

... ugh. Not pretty. Here is another example of using `find` and `xargs` 
to [list classes in all jar files][1].

[1]:  Perl-Goodies-List-contents-of-all-jar-files
[hn]: http://news.ycombinator.com/item?id=3659972

## Categories
unix, perl, programming, Files
