# Perl Goodies ~ List contents of all jar files

## 2012/01/11 11:46

This little script comes in handy when searching for class names in a set of jar files. It's called lsjar.pl and I've used it many times. 

    #!/usr/bin/perl
    use strict;
    use File::Find;
    
    find (\&wanted, @ARGV);
    
    sub wanted 
    {
    	 my $filename = $File::Find::name;
    
    	 if ($filename =~ /\.jar$/){
    		  print "\n$filename\n===============\n";
    		  my @result = qx (jar -tvf $filename);
    		  print @result;
    	 }
    }
    
You call it like this...

    perl c:/home/scripts/lsjar.pl $LIB_DIRECTORY

Where $LIB_DIRECTORY is the directory where .jar files are located. This is a recursive search.

Update: The same functionality can be achieved using `find` and `xargs` like so...

    find . -name "*.jar" | xargs -I % sh -c '{ echo %; jar -tvf %; }'

... or if - like me - you're really wedded to perl ...
   
    find . -name "*.jar" | xargs -I % perl -e 'print "%\n";print `jar -tvf %`;'

... ok this is the last round of unix golf - I promise ...

    find . -name "*.jar" | perl -nle 'print "$_\n".`jar -tvf $_`'

## Categories

Perl, Programming, Tools, Java, Jar, Unix, Files
