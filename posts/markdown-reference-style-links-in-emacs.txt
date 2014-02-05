# Markdown reference-style links in Emacs
## 2011/09/26 20:34

I've pretty much forgiven John Gruber's rampant defense of all
things Apple, for one reason only. He invented [Markdown][1].

Markdown is web-writing for humans. It is human-writable markup that
uses a carefully selected subset of email conventions. The philosophy
behind Markdown is that text written for the web should be readable in
source form. This is important because if you write for the web, your
writing could over time take on many representations but the canonical
form should be readable. This isn't easy if you use HTML. Compare this
HTML code...

    You should consider <a href="http://en.wikipedia.org/wiki/Canonicalization">Canonicalization</a> of your website's URLs

... to this equivalent inline markdown link...

    You should consider [Canonicalization](http://en.wikipedia.org/wiki/Canonicalization) of your website's URLs

... The latter is more readable. Markdown also allows for
reference-style links like this...

    You should consider [Canonicalization][1] of your website's URLs...
    ...
    [1]: http://en.wikipedia.org/wiki/Canonicalization

The reference URLs can then be placed anywhere in the text (but
usually at the bottom) which makes the source text more readable still. 
There is a [markdown-mode for Emacs][2] but it doesn't come with a
function/key-combination to install reference style links. My Lisp is
rusty but I managed to cobble together this script which does just
that. 

    (defun markdown-insert-ref-link (link-url link-ref link-title start end)
      "Insert markup for a reference-style link of the form [selected text][link-ref].
        The link reference is added at the end of the current paragraph.
        [link-ref]: link-url   \"link title\""
      (interactive "sLink URL: \nsLink Ref. (e.g. '1' or 'md'): \nsLink Title: \nr")
      (goto-char start)
      (insert "[")
      (goto-char (+ 1 end))
      (insert "][")
      (insert link-ref)
      (insert "]")
      (forward-paragraph)
      (insert (concat 
               "\n[" link-ref "]: " 
               link-url 
               (if (> 0 (length link-title))
                   (concat "\t \"" link-title "\"")
                 )))

      (goto-char (+ (length link-ref) 4 end))
      
      )
    
    (define-key text-mode-map "\C-xar" 'markdown-insert-ref-link)

Select the text you want to turn into a web link, then press
[CTRL-x a r] . When you run this function you will be prompted for a
URL, a short reference (You can use numeric references if you like - I
prefer short 2-letter references myself) and an optional link
title. You can leave the link title blank if you like. Ideally I'd
like if the script could automatically assign new numeric references
but that's a job for another day. The function will insert the
reference link at the end of the current paragraph (this can be handy
if you're working on a large document) but you can move it to the end
of the document if you prefer. Needless to say, I used this function
while writing this blog post. **I'm 100% sold on Markdown's utility. I
think it should be thought in Universities. Word processors come and
go, Markdown is forever**. My wife has just started a law degree and
I really think she needs to start using Markdown. She wrote her first
thesis using an old 286 running word-perfect in the mid
90s. Needless to say there is no longer a soft-copy of it, so it
shouldn't be too difficult to convince her to use Markdown.

## You might also like...

 * [Text files and Me - Part 1][3]
 * [Markdown reference links in TextMate][4]

## Categories
Markdown, Writing, Emacs, Lisp

[1]: http://daringfireball.net/projects/markdown/
[2]: http://jblevins.org/projects/markdown-mode/
[3]: http://www.leancrew.com/all-this/2011/02/text-files-and-me-part-1/
[4]: http://www.leancrew.com/all-this/2011/09/markdown-reference-links-in-textmate/
