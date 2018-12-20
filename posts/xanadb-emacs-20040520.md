# Bulk editing with Emacs
## 2004/05/20 08:00
_File under personal programming folklore._  
I needed to add a header and footer to 800+ JSP files.The header would
look something like this
    <!-- start of file: $filename -->
(where $filename is the filename of the JSP file), and the footer would look like this 
    <!-- end of file: $filename -->
Adding these 2 lines to the start and end of each of the 800+ files
manually was not an option.  I didn't want to go to the trouble of
writing a perl script to do it.  This is precisely the kind of task
Emacs is well suited to.
 * First I defined a function to insert the current buffer's filename at the cursor and bound it to a keystroke (Ctrl-C + Ctrl-F)
       (defun insert-filename()
       "Insert the filename of the current buffer at point"
       (interactive)
       (insert buffer-file-name)
       )
       (global-set-key "\C-c\C-f" 'insert-filename)
 * Then I dragged all 800 files into a new Emacs session
 * Hit <i>Ctrl-x Ctrl-b</i> to open the buffer list and place the
   cursor at the first file in the buffer list
 * Hit <i>Ctrl-(</i> to start recording keystrokes
 * Hit enter to open the selected buffer, then <i>ALT-<</i> to go
   to the start of the buffer
 * type '<-- start of file: ', then hit <i>Ctrl-C Ctrl-F</i> and type '-->'
 * Hit <i>Alt-></i> to go to the end of the buffer
 * type '<-- end of file: ', then hit <i>Ctrl-C Ctrl-F</i> and type '-->'
 * Hit <i>Ctrl-x Ctrl-s</i> to save the current buffer
 * Hit <i>Ctrl-x b</i> and hit enter to switch back to the buffer list
 * Hit <i>Ctrl-n</i> to move down to the next buffer
 * Hit <i>Ctrl-)</i> to stop recording keystrokes
 * I have just created a keyboard macro. To repeat this operation on
   the next file in the list I hit <i>Ctrl-x e</i>.This will execute
   the recorded keystrokes.
 * If I want to repeat any operation N times I hold down the Ctrl key
   and type the number of times I wish to repeat.
   
 * Once I'm satisfied that the recorded macro works, (by executing it
   once or twice and looking at the file contents) I hold down the
   Ctrl key, type 800, then hit <i>Ctrl-X e</i>. Emacs chugs along
   inserting the header and footer in 800 files. I sit back and grin.
   
Paul Ford has some pretty decent
[Emacs Tips & Tricks](http://ftrain.com/util_emacs_hints.html).
## Categories
Emacs
