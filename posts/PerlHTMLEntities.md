# Perl & HTML Entities

## 2012/03/10 14:04

I use the following snippet of code to transform HTML entities (which 
seem to get turned into actual characters when the editor form is 
submitted - this I think is browser specific but I can't be sure) back 
to their ascii representation so that for example, the &#153; character 
(octal 0231, decimal 153) gets turned into this ` &#153; ` in the plain text 
source from which a blog post is built

    $text =~ s/([\200-\377])/'&#'.ord($1).';'/eg;

There's still a couple of rough edges in this blog. Right now there 
seems to be no way to escape a HTML entity which will survive the 
edit/save/review round-trip. This is why - right now - I need to have a 
space between the & and the # chars in the paragraph above. I need to 
fix that. Onwards and Upwards.
Update: It's fixed! That line of code above was being executed before 
saving and also again when loading the saved post back into web-based 
editor. This is why escaping wasn't surviving the round-trip. To escape 
a html entity in [Markdown][] just enclose it in back-ticks.

    `&#153;` 

Update: As usual with perl, there's more than one way to do it and if 
there's something that needs doing, someone has done it already. 
HTML::Entities seems to be one of the standard modules that ships with 
Perl out of the box. A more elegant alternative to the above regexp...

    use HTML::Entities;
    $text = encode_entities($text,"\200-\377");

... I briefly considered building my own hash of numeric values to names 
but strongly suspected there was already a perl module that did this. 
Glad I didn't waste too much time.

[Markdown]: http://daringfireball.net/projects/markdown/

## Categories
HTML, Perl
