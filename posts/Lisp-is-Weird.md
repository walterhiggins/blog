# Lisp is Weird

## 2012/11/22 11:35

I spent a bit of time wrestling with this old elisp code in my .emacs 
file to get it working again. It broke in the intervening 9 years since 
I first wrote it. Anyone who says Software Rot doesn't exist, hasn't given it enough time...

    ;---------------------------------------
    ; AKA (Also Known As)
    ;
    ; I need to be able to duplicate files across mutliple directories but I 
    ; don't have an 'ln -s' facility in my OS.
    ; If I edit a file in one location, I want those edits to also be saved to 
    ; another location automatically.
    ;--------------------------------------
    (defvar aka-list (make-hash-table :test 'equal))
    (defun aka-hook ()
      (maphash 
       (lambda (source targets) 
         ;; if the current file matches an entry in the aka-list lookup table...
         (if (string-match source buffer-file-name) 
             ;; loop over each target file/dir
             (while targets 
               (setq target (car targets))  ;; current target
               (setq targets (cdr targets)) ;; ensure loop ends
               (setq mirrored 
                     (concat target
                             (mapconcat 'identity 
                                        (split-string buffer-file-name source) "")))
               (message (concat "duplicating " buffer-file-name " to " mirrored))
               ;; need to retain buffer file name 
               (setq old buffer-file-name)
               (copy-file buffer-file-name mirrored 't)
               (setq buffer-file-name old)
               );; end targets loop
           ) ;; end if match
         );; end lambda
       aka-list)
      )
    (add-hook 'after-save-hook 'aka-hook)
    ; To add a new hard link (works with directories or files)
    ;
    ; (puthash "c:/src" '("c:/mirror1" "c:/mirror2") aka-list)
    ; (puthash "c:/main.c" '("c:/main_bak.c") aka-list)

... Perl gets a hard time for being unreadable but there's no getting 
around it - Lisp is just plain weird. I can just about understand this 
code - I'm not particularly proud of it but it works. Those bloody round 
brackets make editing a nightmare. It's just too easy to make mistakes 
and too difficult to interpret the structure / flow-control. Maybe I'm 
just making the standard newbie mistakes all lisp novices make - I still 
haven't had that flash of insight true enlightened lispers claim. In the 
meantime I'm glad there are other curly-braced functional languages 
(Javascript) out there.
    
## Categories
Lisp, Javascript, Emacs
