# Rounded Corners in GIMP
## 2004/10/20 18:00

<img align="right" src="images/xanadb/kate/rounded.jpg" alt="rounded image"/>

Dan Cederholm (the man behind [blogger's redesign][1] had a great
article on creating rounded [mountaintop corners][2] for web design.
Adding rounded corners to any image is now easy using GIMP and the
following script which does the following...

[1]: http://www.blogger.com
[2]: http://www.alistapart.com/articles/mountaintop/

 1. Create a new alpha layer above all other existing layers
 2. paint in rounded corners in the color of choice in the top-right,
 top-left, bottom-right and bottom-left corners
 
To use the script copy and paste the following code to a file called
"rounded-corners.scm" and save it to your share/GIMP2.0/scripts folder
and restart gimp. To run the script, right-click on the image in
question and select 'Script-Fu'/'Alchemy'/'Add Rounded
Corners...'. You will be prompted for the desired color, pick a color
and click 'OK'.

    (define (script-fu-rounded-corners img drawable color)
      (define (draw-line drawable startx starty endx endy)
        (let ((line (cons-array 4 'double)))
          (aset line 0 startx)
          (aset line 1 starty)
          (aset line 2 endx)
          (aset line 3 endy)
          (gimp-pencil drawable 4 line)
          ))
      (gimp-undo-push-group-start img)
      (let* ((w (car (gimp-drawable-width img)))
             (h (car (gimp-drawable-height img)))
             (corner-layer (car (gimp-layer-new img w h 
                                                RGB-IMAGE 
                                                "corners" 
                                                100 
                                                NORMAL-MODE)))
             )
        (gimp-layer-add-alpha corner-layer)
    
        (gimp-image-add-layer img corner-layer -1)
        
        (gimp-rect-select img 0 0 w h REPLACE FALSE 0)
        (gimp-edit-clear corner-layer)
        
        (gimp-palette-set-foreground color)
        (gimp-brushes-set-brush "pixel (1x1 square)")
        ; 
        ; top-left
        ;
        (draw-line corner-layer 0 0 4 0)
        (draw-line corner-layer 0 0 0 4)
        (draw-line corner-layer 0 1 2 1)
        (draw-line corner-layer 1 0 1 2)
        ;
        ; top-right
        ;
        (draw-line corner-layer (- w 5) 0 w 0)
        (draw-line corner-layer (- w 1) 0 (- w 1) 4)
        (draw-line corner-layer (- w 3) 1 w 1)
        (draw-line corner-layer (- w 2) 0 (- w 2) 2)
        ;
        ; bottom-left
        ;
        (draw-line corner-layer 0 (- h 1) 4 (- h 1))
        (draw-line corner-layer 0 (- h 5) 0 (- h 1))
        (draw-line corner-layer 1 (- h 3) 1 (- h 1))
        (draw-line corner-layer 0 (- h 2) 2 (- h 2))
        ; 
        ; bottom-right
        ;
        (draw-line corner-layer (- w 5) (- h 1) w (- h 1))
        (draw-line corner-layer (- w 1) (- h 5) (- w 1) (- h 1))
        (draw-line corner-layer (- w 3) (- h 2) w (- h 2))
        (draw-line corner-layer (- w 2) (- h 1) (- w 2) (- h 3))
    
        
        (gimp-selection-none img)
        (gimp-undo-push-group-end img)
        (gimp-displays-flush)
        )
      )
    
    (script-fu-register "script-fu-rounded-corners"
                        _"&lt;Image&gt;/Script-Fu/Alchemy/Add Rounded Corners..."
                        "Adds Rounded corners to image"
                        "Walter Higgins"
                        "Walter Higgins"
                        "Oct 2004"
                        "RGB* GRAY* INDEXED*"
                        SF-IMAGE "Image" 0
                        SF-DRAWABLE "Drawable" 0
                        SF-COLOR      _"Color"         '(255 255 255))

### update
Turns out someone has already written a rounded-corners script
(Script-Fu/Decor/Round Corners) that does much more than this in fewer
lines of code. Doh!

## Categories
Gimp, Scheme, Graphics
