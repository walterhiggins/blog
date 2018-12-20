# A little lisp

## 2011/09/25 09:35

I've been using Emacs for as long as I've been married. Over time it
has become the only writing environment I feel truly comfortable
in. No web-based rich text editor even comes close. Like my wife,
Emacs can still at times be mysterious. This is just a short note on
what I've done so far to get this new personal publishing system in
place.

     (add-hook 'text-mode-hook 'auto-fill-mode)
     (defun insert-time ()
       (interactive)
         (insert (format-time-string "%Y/%m/%d %R")))
     (setq-default indent-tabs-mode nil)
     (setq-default tab-width 4)
     (setq indent-line-function 'insert-tab)

Handy tip (It took me an hour to figure this out): To convert a block of text into email-commented text...

    You think water moves fast? You should see ice. It moves like it has a
    mind. Like it knows it killed the world once and got a taste for
    murder. After the avalanche, it took us a week to climb out. Now, I
    don't know exactly when we turned on each other, but I know that seven
    of us survived the slide... and only five made it out. Now we took an
    oath, that I'm breaking now. We said we'd say it was the snow that
    killed the other two, but it wasn't. Nature is lethal but it doesn't
    hold a candle to man. 

... to this ...

    > You think water moves fast? You should see ice. It moves like it has
    > a mind. Like it knows it killed the world once and got a taste for
    > murder. After the avalanche, it took us a week to climb out. Now, I
    > don't know exactly when we turned on each other, but I know that
    > seven of us survived the slide... and only five made it out. Now we
    > took an oath, that I'm breaking now. We said we'd say it was the
    > snow that killed the other two, but it wasn't. Nature is lethal but
    > it doesn't hold a candle to man. 

...M-x comment-region and enter '>' as the comment-start value.

[Lipsum courtesy of Samuel L. Jackson](http://slipsum.com/)

## Categories
Lisp, Emacs
