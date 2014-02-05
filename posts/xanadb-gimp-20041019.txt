# An improved Interlace
## 2004/10/19 08:00

A couple of months ago I tackled the problem of writing a simple
plugin/script for my Graphics Editor of choice [Gimp][1]. A couple of
things about that solution bothered me. Namely the manual steps which
I outline as a precursor to running the script. Copying layers,
changing layer opacity, blah blah blah.  These steps shouldn't have
been required at all - the script should have done that for you.  Well
now it does...

copy and paste the following code into a file called interlace.scm.
Save that file to your share/Gimp2.0/scripts folder and restart gimp.
There should be an item called 'Interlace...' in the
script-fu/Alchemy/ submenu. When you run this script it creates an
interlaced effect so that the image looks like it's been grabbed from
a TV screen. Don't worry, the effect is undoable.

    (define (script-fu-interlace img drawable nth)
      (gimp-undo-push-group-start img)
      (let* ((interlaced-layer (car (gimp-layer-copy drawable 1)))
             (width (car (gimp-drawable-width interlaced-layer)))
             (height (car (gimp-drawable-height interlaced-layer)))
             (y 0)
            )
        ; 
        ; set opacity of original layer to 60 %
        ;
        (gimp-layer-set-opacity drawable 60)
        ;
        ; add copied layer to image
        ;
        (gimp-image-add-layer img interlaced-layer -1)
        ;
        ; call it "Interlaced"
        ;
        (gimp-drawable-set-name interlaced-layer "Interlaced")
        ;
        ; erase every nth row of interlaced layer
        ;
        (while (< y height)
               (gimp-rect-select img 0 y width 1 REPLACE FALSE 0)
               (gimp-edit-clear interlaced-layer)
               (set! y (+ y nth))
               )
        (gimp-selection-none img)
    
        (gimp-undo-push-group-end img)
        (gimp-displays-flush)
        )
      
      )
    (script-fu-register "script-fu-interlace"
                        _"&lt;Image&gt;/Script-Fu/Alchemy/Interlace..."
                        "Interlace Image"
                        "Walter Higgins"
                        "Walter Higgins"
                        "Oct 2004"
                        "RGB* GRAY* INDEXED*"
                        SF-IMAGE "Image" 0
                        SF-DRAWABLE "Drawable" 0
                        SF-ADJUSTMENT "Every Nth Pixel" '(3 2 10 1 1 0 0)
                        )

What with Emacs and GIMP both using LISP (or dialects of LISP) for
their APIs, a Little LISP goes a long way.

## Categories
Gimp, Lisp, Graphics

[1]: http://www.gimp.org/
