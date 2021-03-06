# Lisp is useful

## 2012/11/24 15:00

I'm editing an XML file in Emacs and I need to create a large XML file with many repeating occurrences of the same element with just minor variations between each occurrence. This is what one element looks like...

    <action id="1">
        <params>
            <param name="x" value="100"/>
            <param name="y" value="200"/>
        </params>
    </action>
    
...lets say I want to create 10,000 such elements in an XML document but each `<action>` element must have a unique id. Normally (in Emacs) I'd create a record a keyboard macro while copy/pasting a single element then re-run the macro 10,000 times `CTRL 10000 CTRL x e` but that would give me 10,000 `<action>` elements with the same `id` attribute value. I was thinking about this and what I really want is to select the element, turn it into a template and copy & paste it 10,000 times changing the `id` attribute each time. Lisp to the rescue...

    (defun region-template-copy (repeats start end)
      (interactive "nNumber of times to copy: \nr")
      (save-excursion
    	 (let ((template (buffer-substring start end)))
    		(dotimes (number repeats number)
    		  (let ((i (number-to-string (+ 1 number))))
    			 (insert (replace-regexp-in-string "{i}" i template))
    			 )
    		  ) ;; end dotimes
    		) ;; end let
    	 ) ;; end save-excursion
      )

... what this does is let me take one instance like this...

    <action id="{i}">
        <params>
            <param name="x" value="100"/>
            <param name="y" value="200"/>
        </params>
    </action>

... if I select it then run the `region-template-copy` function I'm prompted for the number of times I want to copy and it copies the selected region that number of times, replacing each instance of `{i}` with the current copy number. So selecting the above text and running `region-template-copy 3` will result in the following new text inserted in the buffer...

    <action id="1">
        <params>
            <param name="x" value="100"/>
            <param name="y" value="200"/>
        </params>
    </action>
    <action id="2">
        <params>
            <param name="x" value="100"/>
            <param name="y" value="200"/>
        </params>
    </action>
    <action id="3">
        <params>
            <param name="x" value="100"/>
            <param name="y" value="200"/>
        </params>
    </action>

... Pretty useful right? Although the Lisp function above is short, it took a bit of digging to figure out how to do it - again - this isn't necessarily a criticism of Lisp - I just don't get to use it that often. ELisp in particular though reminds me of XSLT - I don't use it often and each time I do I struggle with it. A while ago I'd have probably done this outside Emacs altogether and used [TinyTemplate][1] but I'm trying to force myself to make this kind of stuff easier by doing it in Emacs itself - I know Emacs is perfect for this kind of meta-programming - I just need to apply myself to learning more eLisp.

[1]: https://github.com/walterhiggins/tinytemplate

## Categories
Lisp, Emacs
