# Here
## 2012/08/22 18:56
This is a snippet of code you might find useful if you write code using 
Emacs and occasionally need a way to quickly insert the current file 
name and line number in a source file. 

    (defun wph-here()
      "Inserts the filename and line number at the current point"
      (interactive)
      (insert buffer-file-name)
      (insert ":")
      (insert (number-to-string (count-lines (point-min) (point))))
    )

You can bind the function to any key combination you like. I use CTRL+c CTRL+f ...

    (global-set-key "\C-c\C-f" 'wph-here)

> Imagine you're a carpenter. The wooden handle of the tool you're using 
> is rough and unwieldy so you stop what you're doing and tweak it.
> -- [Twitter / @walter](https://twitter.com/walter/status/238360118348115969)
    
## Categories
Emacs, Lisp