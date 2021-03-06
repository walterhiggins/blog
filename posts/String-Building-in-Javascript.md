# String Building in Javascript

## 2012/09/10 16:11

On page 66 of my dog-eared copy of 'Programming Perl' there's a chunk of code
which on first reading puzzled me.

    print <<'EOF';
    All things (e.g. a camel's journey through 
    A needle's eye) are possible, it's true.
    But picture how the camel feels, squeezed out
    In one long bloody thread, from tail to snout.
                                    -- C.S. Lewis
    EOF

My first thought on reading this was "How could that possibly work?" I
had never encountered [Here Documents][h] before. My programming
languages prior to perl were Basic, Z80 Assembly, Pascal, Cobol, C,
C++ and flavours thereof, none of which supported Here Documents or
any kind of fancy string building other than plain-old concatenation. 
There's more than one way to build a string but I bet most of us
(programmers that is) stick with good old concatenation for most
tasks. I've compiled a list of string building mechanisms and ordered
them in increasing order of sophistication/usefulness...

    |----------------+-------------------------------------+--------------------------------|
    | Mechanism      | Example                             | Languages                      |
    |----------------+-------------------------------------+--------------------------------|
    | Concatentation | my $str = "Hello " . name;          | Javascript,Java,               |
    |                |                                     | C (strcat)                     |
    |                |                                     | and pretty much all            |
    |                |                                     | programming languages.         |
    |----------------+-------------------------------------+--------------------------------|
    | Interpolation  | my $str = "Hello $name";            | Perl, PHP. Java and C          |
    |                |                                     | support something like this    |
    |                |                                     | through sprintf() but it's not |
    |                |                                     | as easy as perl-style          |
    |                |                                     | interpolation.                 |
    |----------------+-------------------------------------+--------------------------------|
    | Here Documents | my $str <<EOM;                      | Perl, Unix Shell and others.   |
    |                | Hello $name                         |                                |
    |                | How are you?                        |                                |
    |                | EOM                                 |                                |
    |----------------+-------------------------------------+--------------------------------|
    | Templating     | $tmpl = Text::Template->new($file); | Most languages have some       |
    |                | $name = "walter";                   | (or in perl's case - many)     |
    |                | $str = $tmpl->fill_in();            | templating libraries for       |
    |                |                                     | generating HTML and other      |
    |                |                                     | text documents.                |
    |----------------+-------------------------------------+--------------------------------|

...so the running order is Concatenation => Interpolation => Here Docs
=> Templating. If you're building strings you're probably using one
of these methods. The exact syntax might differ (a `+` instead of a
`.` if you're using javascript or java instead of perl) but these are
the mechanisms we use to build strings. 

It's bugged me for the longest time that Javascript - a language in
which string building has become really important - doesn't support
Here documents. Right now if you wanted to create the C.S. Lewis quote
in Javascript you could do it like this...

    var quotation = "All things (e.g. a camel's journey through\n" 
    + "A needle's eye) are possible, it's true.\n"
    + "But picture how the camel feels, squeezed out\n"
    + "In one long bloody thread, from tail to snout.\n"
    + "                                -- C.S. Lewis\n";

... which looks noisier with the addition of all those `"`, `+` and
`\n` characters. Or you could write it like this...

    var quotation = "\
    All things (e.g. a camel's journey through \
    A needle's eye) are possible, it's true. \
    But picture how the camel feels, squeezed out \
    In one long bloody thread, from tail to snout. \
                                    -- C.S. Lewis\n";

... which is less noisy but still uglier than the equivalent perl code. 
It's also not part of the [ECMA][2] standard. The other alternative is 
to use a javascript templating library. There are many - [EJS][e] and 
(shameless plug) [SXOOP.template][s] are just two. Templating is the 
most powerful string building mechanism but it can be unwieldy - the 
string template is usually remote from the code which uses it - and 
might be overkill for what you want to do. This is where Here Documents 
come in - they fill the niche between Interpolation and Templating.
So Javascript today doesn't support Here Documents - they are just not 
part of the language spec. I've often been impressed by Perl's 
source-filters - a feature which lets you extend the perl syntax so you 
can write perl in any way you like. I thought it would be nice to be 
able to write Here Documents in javascript and wondered "How hard could 
it be?" After a couple of hours of hacking I [posted the results on 
GitHub][gh]. So now you can write code like this...

    var quotation = ""/*[[
    All things (e.g. a camel's journey through 
    A needle's eye) are possible, it's true. 
    But picture how the camel feels, squeezed out 
    In one long bloody thread, from tail to snout. 
                                    -- C.S. Lewis
    ]]*/;

... which is at least less ugly than the previous two
iterations. Obviously there are some trade-offs and drawbacks to this.

 * It needs a preprocessor - [rhere.js][gh] to process the source file 
   before deploying. If you're a fan of ExtremeProgramming Neologisms 
   you'll no doubt dismiss this as a CodeGeneration Smell. 

 * It's code (albeit only a string literal) embedded in a comment.

If you're OK with both of these trade-offs then this might be the Here 
Document you were looking for. For a huge number of programmers either 
one of these trade-offs will be unacceptable - and that's OK. You might 
not like having to 'build' your javascript (see [Rhino][r] for how easy 
custom build steps can be done using Rhino). Or you might be 
idealogically opposed to Code-Generation. In short I can think of a few 
reasons why the Here Document solution I provided might be wrong for you 
or your current project. And that's OK.

Of course, Here documents only become truly useful when combined with 
interpolation so that you can create a string/template hybrid like this...

    var mailMsg = ""/*[[    
    Dear {salutation},
    
    I wish to inform you that {book_name} is {overdue} days overdue.
    Please return the book at your earliest convenience.
    
    The Library.
    ]]*/;
    
... where `{salutation}` , `{book_name}` and `{overdue}` are variables 
that are filled in on the fly. Luckily the SXOOP.strings module comes 
with a `fmt` function which does simple interpolation like this...

    var mailMsg = SXOOP.strings.fmt(""/*[[    
    
    Dear {salutation},
    
    I wish to inform you that {book_name} is {overdue} days overdue.
    Please return the book at your earliest convenience.
    
    The Library.
    
    ]]*/,{saluation: "Sir", book_name: "Javascript: The Good Parts", overdue: 22});

`SXOOP.strings.fmt` will take a string and an object (either an object 
or an array) and substitute `{property}` with the equivalent property of 
the object or array. Using arrays, the above code could also be written 
like this...

    var mailMsg = SXOOP.strings.fmt(""/*[[    
    
    Dear {0},
    
    I wish to inform you that {1} is {2} days overdue.
    Please return the book at your earliest convenience.
    
    The Library.
    
    ]]*/,["Sir", "Javascript: The Good Parts", 22]);

You can find more information on the [sxoop-strings github page][gh]. 

[2]: http://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml?showone=Multiline_string_literals#Multiline_string_literals
[e]: http://embeddedjs.com/getting_started.html
[s]: https://github.com/walterhiggins/sxoop-template
[gh]: https://github.com/walterhiggins/sxoop-strings
[h]: http://en.wikipedia.org/wiki/Here_document
[r]: Rhino.html

## Categories
Javascript, Here Document, Strings, Templating, GitHub
