# Simulating "ln -s" in Emacs
## 2003/12/08 09:00

I'm editing a lot of JSP code lately.  The code resides under
source-control on a separate drive to my C:/ drive where the web-app
resides.  For various reasons, I can't simply point my web-app server
at my source-control drive.  When I check stuff out and edit it in
Emacs I must remember to copy the edited file to my C:/ drive.
Similarly, if I edit the file on the C:/ drive and forget to copy it
back to the source-control drive I'm in big doo-doo.  As you can
imagine this was getting to be a pain.


The unix solution would be to 'ln -s' the two drives/directories.  'ln
-s' doesn't work on NT or Win2K. This is not good.  There are cases
where I want to edit a file on a source-control drive and always be
sure that those edits also get saved to a 'live' directory.  This is
so I'm not copying and pasting files and getting confused about which
files are in synch.  When I hit Ctrl-x Ctrl-s in Emacs I want the file
to be saved in both directories.  If I edit a file
<i>i:/project-X/test.jsp</i> I want it to be saved to both
<i>i:/project-X/test.jsp</i> (the source drive) and
<i>c:/tomcat/test.jsp</i> (the live directory).  Here's how I did
it...

    ; AKA (Also Known As)
    ;
    ; I need to be able to duplicate files across mutliple 
    ; directories but I don't have an 'ln -s' facility in my OS.
    ; If I edit a file in one location, I want those edits to 
    ; also be saved to another location automatically.
    
    ; 
    ; Define a global var for storing mappings
    ;
    (defvar aka-list (make-hash-table :test 'equal))
    ;
    ; This function gets called everytime I save a file in Emacs
    ;
    (defun aka-hook ()
      (maphash (lambda (key value) 
                 (if (string-match key buffer-file-name)
                     ((lambda (key value)
                        (while value
                          (setq my-element (car value))
                          (setq value (cdr value))
                           (setq mirrored (concat my-element
                                               (mapconcat 'identity 
                                                          (split-string buffer-file-name key) "")))
                        (message (concat "duplicating " buffer-file-name " to " mirrored))
                        (setq old buffer-file-name)
                        (copy-file buffer-file-name mirrored 't)
                        (setq buffer-file-name old)
                        )
                        ) key value)
                      
                   )
                 )
               aka-list)
    )
    ;
    ; Dont forget to add hook
    ;
    (add-hook 'after-save-hook 'aka-hook)
    ;
    ; Set up directory mappings (will also work for individual files
    ;
    ;        source           destination
    (puthash "c:/folder1/sub" '("c:/mirror1" "c:/mirror2") aka-list){@/esc@}</div>

## Categories
Emacs
