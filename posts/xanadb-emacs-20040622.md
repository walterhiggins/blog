# JSP mode for Emacs
## 2004/06/22 15:00

JSP has been around for 5+ years now and I still don't see an easy to
install JSP mode for Emacs (not to say that there aren't solutions out
there - most involve the use of non-standard multi-mode for mode
switching - this gives nice context awareness - when you move to a
java portion , java or jde mode is enabled, when you move to the html
portion, html-mode is enabled - syntax coloring is enabled. The last
time I looked though, indenting java code was a problem).

I can live without syntax coloring but I freely admit I'm a bit of a
stickler when it comes to indentation.  (that may come as a shock if
you look at some of the lisp code on this site - lisp indentation
remains a complete mystery to me). My biggest gripe when editing JSP
is when I have to correctly indent a large block of Java code to make
it more readable (yes I know large blocks of java code should be
turned into beans or tags - bad JSP programmer, bad).  If I'm editing
c or java source I hit Ctrl-C Ctrl-Q and the entire file gets
indented.  When I try that in JSP (having switched to java-mode) I get
'Cannot find balanced expression' messages.

The solution is to temporarily insert a '{' just after the &lt;% and a
'}' just before the %&lt;, then hit Ctrl-C Ctrl-Q to indent and then
remove the '{' and '}' - a tedious procedure but then you chose emacs
to avoid the tedium. The following bit of lisp code isn't a full blown
JSP mode (its not even a new mode - it just adds additional
keybindings for html-mode) but it provides a neat feature for this
long-time (4 years) JSP programmer and Emacs user - indentation of
java code.

Copy the following block of code to your .emacs file for
(fingers-crossed) trouble-free jsp editing.

    ; jsp stuff
    ;
    ; functions to perform correct indentation of java code within a 
    ; JSP page. I can live without syntax coloring - I can't live 
    ; without proper indentation
    ;
    (setq auto-mode-alist
          (cons '("\\.jsp\\'" . html-mode) auto-mode-alist))
    
    (defun jsp-java-sob ()
      "Return the point for the enclosing <% or nil if not present"
      (save-excursion 
        (search-backward "<%")))
    
    (defun jsp-java-eob ()
      "Return the point for the enclosing %> or nil if not present"
      (save-excursion 
        (search-forward "%>")))
    
    (defun jsp-in-java-debug ()
      (interactive)
      (if (jsp-in-java)
          (message "debug: in java code")
        (message "debug: not in java code")))
    
    (defun jsp-in-java ()
      (save-excursion
        (let* ((current-point (point))
               (start-java-tag (jsp-java-sob))
               (end-java-tag (jsp-java-eob)))
          (and (> current-point start-java-tag) 
    			  (< current-point end-java-tag)))))
    
    
    (defun jsp-indent-java ()
      (interactive)
      "Indent a java block within a JSP page "
      (save-excursion 
        (let ((start (+ 2 (jsp-java-sob)))
              (end (jsp-java-eob) ))
          (if (string= "!" (char-to-string (char-after start)))
              (setq start (+ start 1))
            nil)
          (if (jsp-in-java)
              (progn 
                (java-mode) 
                (goto-char start)
                ;; needed for proper indentation - removed later
                (newline)    
                (insert "{")
                (newline)
                
                (goto-char end)
                ;; needed for proper indentation - removed later
                (newline)
                (insert "}") 
                (newline)
                ;; 
                ;; perform the indentation
                ;; 
                (indent-region (+ start 2) (- end 0) nil)
                ;;
                ;; now remove the text we termporarily added for indentation
                ;;
                (delete-region (- (point) 3) (point)) 
                (delete-region start (+ start 3))
                (html-mode))
            ()))))
    
    (setq html-mode-hook
          '(lambda ()
             (define-key sgml-mode-map "\C-c\C-q"  'jsp-indent-java)
             ))


## Categories
Emacs, Java, JSP
