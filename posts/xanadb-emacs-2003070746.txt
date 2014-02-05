# Emacs for blogging
## 2003/07/07 07:46

_Here's a few simple emacs shortcuts I've started using for editing
this website._  

Learning Emacs Lisp is a daunting task. Its harder to get your head
around Lisp than it is to learn Perl, perhaps because the syntax is so
foreign. I've created a file called xanadb.el which has all of the
lisp code I'm currently using to edit new stuff for the website. (Each
shortcut listed was used to create this post). In the hope that it
might prove useful to someone else, I'm posting it here


    ;-------------------
    ;
    ; BLOG related stuff 
    ;
    ;--------------------
    ; CTRL-C CTRL-B n creates a new blog entry
    (defun blog-new-post (topic)
      "create a new post for weblog"
      (interactive "sPlease enter topic name: ")
      ; open the file
      (find-file (concat "~/website/etc/posts/" 
               topic "."
               (if (y-or-n-p "hours ? ")
              (format-time-string "%Y%m%d%H%M")
                 (format-time-string "%Y%m%d"))))
      ; set cursor so I can start typing the title
      ; &lt;!--*->  * marks where cursor will be
      (insert "&lt;!---->\n")
      (beginning-of-buffer)    
      (forward-char 4)         
    )
    ; select a region
    ; type CTRL-C CTRL-B p
    ; region becomes preface
    (define-skeleton blog-preface
      "markup text as preface"
      nil
      "&lt;div class=\"preface\">" _ "&lt;br/>&lt;/div>")
    ; select a region
    ; type CTRL-C CTRL-B u
    ; region becomes update
    (define-skeleton blog-update
      "markup text as update"
      nil
      "&lt;div class=\"update\">" (format-time-string "%Y/%m/%d %H:%M")  _ "&lt;/div>")
    ; select a region
    ; type CTRL-C CTRL-B b
    ; region becomes the blog entry blurb that appears on index pages
    (define-skeleton blog-blurb
      "The region is marked up as the blurb "
      nil
      "\n&lt;!-- blurb -->\n" _ "\n&lt;!-- /blurb -->")
    ; Use standard right-aligned images
    ; works on existing selection
    (define-skeleton blog-icon
      "The icon or image that appears on right of page"
      nil
      "&lt;img src=\""
      _ 
      "\"/>")
    (global-set-key "\C-c\C-bn" 'blog-new-post)
    (global-set-key "\C-c\C-bp" 'blog-preface)
    (global-set-key "\C-c\C-bb" 'blog-blurb)
    (global-set-key "\C-c\C-bi" 'blog-icon)
    (global-set-key "\C-c\C-bu" 'blog-update){@/esc@}</div>

I just discovered [BlogMax: Emacs for
Blogging](http://freshmeat.net/projects/blogmax/?topic_id=243%2C64")

## Categories
Blogging, Emacs

