# A Markdown Link Bookmarklet

## 2011/10/03 17:26

This is something I plan to use for quickly inserting 
[Markdown](http://daringfireball.net/projects/markdown/) links. I create 
a new bookmarklet in my browser toolbar with the following location property...

    javascript:void(prompt("","["+document.title+"]("+location.href+")"));

... now when I want to insert a link to an open web page I click the 
bookmarklet and copy and paste the title and link into emacs or my 
[Markdown Textarea](files/markdown_textarea.html).

## Update 20111007

This one inserts reference-style links...

    javascript:rc=prompt("refcode(e.g. '1'","");void(prompt("","["+document.title+"]["+rc+"]["+rc+"]:%20"+location.href));

## Categories
Markdown, Blogging
