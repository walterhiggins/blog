# Replacing Text In Multiple Files : Redux
## 2012/04/02 17:10

A couple of weeks ago I wrote about replacing text in multiple files and 
came up with - what I thought at the time was - a reasonable one-line 
[solution][]. Behold! Thanks to the power of Unix Golf I present a more 
concise one-line command (working in Unix and CygWin)...

    find . | xargs grep -l '{OLD}'  | xargs -I % perl -pi~ -e 's/{OLD}/{NEW}/g' %

... I call this the *Perl Pie* solution since it's Perl's `-p -i -e` 
flags which do much of the heavy lifting. 

> Perl -i specifies that files processed by the <> construct are to be 
> edited in place. It does this by renaming the input file, opening the 
> output file by the original name, and selecting that output file as the 
> default for calls to `print, printf,` and `write`.  
> -- [Programming Perl][1]

This is a much shorter solution than what I came up with earlier; 77 
characters compared to the previous solution's 132. I shaved off a 
couple of characters from the first half of the command by using `grep 
-l` to only show the file name for matches - doing away with the need 
for the subsequent `| cut -d':' -f1` statement, and thanks to `perl -i`, 
there's no need to explicitly open, slurp, and close the file. Less 
typing means less errors. ;-)
    
[1]: http://www.amazon.com/gp/product/0596004923/ref=as_li_tf_tl?tag=xanajavaperle-20
[solution]: TextSubstitution

## Categories
Unix, Perl