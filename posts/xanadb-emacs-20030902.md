# Emacs Java decompiler
## 2003/09/02 11:00


Of limited interest: If you use Emacs and like poking around JAR files
then read on...  First things first: A disclaimer - this bit of
emacs/perl hackery is of limited use but it is going to make *my* life
a lot easier so chances are, someone else might benefit too.

 1. Ever wish you could look at the source code of compiled java class
 libraries to see just what is going on ? Then take a look at <a
 href="http://kpdus.tripod.com/jad.html">Jad</a>
 
 2. Ever wish you could easily browse JAR files ? Change your file
 associations to Use winzip for .jar files.
 
 3. Ever wish you could decompile JAR contents on the fly ? Change
 your files associations to use 'jad -p' for .class files
 
 4. Ever wish you could do all of the above seamlessly from within
 your favourite editor ? Then read on...
 
There are a couple of prerequisites for this to work.  You need to
install JAD and Perl and the Java SDK and umm that's it.  You also
need to tweak your _emacs file as follows...

    (setq auto-mode-alist
          (cons '("\\.class\\'" . java-mode) auto-mode-alist))
    (add-to-list 'file-coding-system-alist 
    	     '("\\.class\\'" dos))
    (custom-set-variables
     ;; should point to your ENV's TEMP variable
     '(archive-tmpdir "c:/Temp/")
     '(archive-zip-extract (quote 
    	("perl" "c:/scripts/perl/unzip.pl")))
     '(archive-zip-use-pkzip t))

Then you need to save the following perl script in c:/scripts/perl/unzip.pl...

    use Cwd 'chdir';
    use utf8;
    $archive = shift @ARGV;
    $extract = shift @ARGV;
    chdir ($ENV{TEMP});
    `jar -xvf $archive $extract`;
    @parts = split /\//, $extract;
    $last = pop @parts;
    `mv $extract $last`;
    if ($last =~ /\.class/){
        # decompile it.
        # dont' forget to change the following 
        # line if you installed JAD anywhere 
        # other than here.
        `c:/jad/jad.exe -p -nonlb $last > $last.java`; 
        `mv $last.java $last`;
        open (JAVA, "<$last");
        @contents = <JAVA>;
        close(JAVA);
        open (JAVA, ">$last");
        print JAVA @contents;
        close (JAVA);
    }

A couple of caveats. 

1. Make sure that Emacs' archive-tmpdir variable is the same as your
 %TEMP% environment variable.
 
 2. Make sure that line 14 of the perl script is correct (points at
 the jad.exe executable)
 
This isn't an elegant solution, but if you only look at .jar files
(and no other compressed archives) in emacs then it's pretty
good. Basically you can use dired to go to a /lib/ directory (usually
where all the .jar files live), middle click on any jar file will
present the jar contents in emacs (this much is default emacs
behaviour). But now when you click on a class to decompress it, you
will be presented with the decompiled source code complete with syntax
highlighting.  If you find this useful let me know - If you know how
it can be improved (I know it *can* be improved - I just don't know
how) drop me a line.

## Categories
Emacs, Java
