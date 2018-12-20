# Use Emacs to track Spending; Org-mode to blow your mind.

## 2011/10/21 22:12

Org-Mode is fairy dust for plain text. Eleven years using Emacs and it 
still surprises me on an almost daily basis. Sometimes it even blows my 
mind. Learning [org-mode][1] has been a series of delightful, slightly 
mind-blowing epiphanies.

    | date             | item      | amount | Total |
    |------------------+-----------+--------+-------|
    | <2011-10-21 Fri> | Eggs      |   1.20 |  1.20 |
    | <2011-10-21 Fri> | Cheese    |   2.45 |  3.65 |
    | <2011-10-21 Fri> | Chocolate |   0.75 |  4.40 |
    |                  |           |        |  4.40 |
    #+TBLFM: $4=vsum(@2$3..@$3);%.2f

Up until recently I was using a Google Docs spreadsheet to track
spending. Now that too has become just another thing I do in Emacs. If
you have Emacs 23 installed on your computer try the following...

 1. Open a new file called ~/spending.org
 2. Type `|date|item|amount|` and hit Enter
 3. Type `|-` and hit Tab.
 
If org-mode is part of your Emacs installation then this text will
have been transformed when you hit the Tab key into ...

    |date|item|amount|
    |-

...this...

    | date | item | amount |
    |------+------+--------|
    |      |      |        |

...pretty cool. No? It gets better. Now when you press tab, the
cursor moves into the next column. Press again and again and it
inserts and moves to the next row. Now go back to the first non-header
row by pressing Shift-TAB repeatedly. Press CTRL+C then . (full
stop). A calendar appears. Just hit Enter to choose today's date. Your
buffer will look something like this. Not pretty.

    | date | item | amount |
    |------+------+--------|
    | <2011-10-21 Fri>     |      |        |

Hit the Tab key again and voila! Cool. Your mind should be fizzing and
popping right about now but wait, there's more!

    | date             | item | amount |
    |------------------+------+--------|
    | <2011-10-21 Fri> |      |        |

Enter anything you like in the `item` column and notice that if the
text you entered is longer than `item` the column expands to fit. Now
enter a numeric value in the `amount` column. Notice it automatically
right-aligns numeric values. That's just one of the many sprinklings
of fairy dust org-mode splashes across plain text. Org-mode's tables
are a god-send. But these plain-text automatically adjusting tables
aren't just tables as you'll see in a moment...

 1. Move the cursor to the end of the header line so it's just to the
    right of the `amount |` text and type `Total` then hit Tab.

        | date             | item | amount | Total |
        |------------------+------+--------+-------|
        | <2011-10-21 Fri> | Eggs |   1.20 |       |

 2. You now have an extra column in the Table. Tab to the first row
    and type `=vsum(@2$3..@$3)`

        | date             | item | amount | Total            |
        |------------------+------+--------+------------------|
        | <2011-10-21 Fri> | Eggs |   1.20 | =vsum(@2$3..@$3) |
    
 3. Hit the Tab key and the text disappears from the column but new
    text appears at the bottom of the table.

        | date             | item | amount | Total |
        |------------------+------+--------+-------|
        | <2011-10-21 Fri> | Eggs |   1.20 |   1.2 |
        |                  |      |        |       |
        #+TBLFM: $4=vsum(@2$3..@$3)
    
This new text is of course a formula just like you would enter in a
Spreadsheet. That's right - org-mode lets you create plain-text
spreadsheets! That popping sound is your mind being blown. Enter
another line of data.

    | date             | item   | amount | Total |
    |------------------+--------+--------+-------|
    | <2011-10-21 Fri> | Eggs   |   1.20 |   1.2 |
    | <2011-10-22 Sat> | Cheese |   3.90 |       |
    |                  |        |        |       |

When you pressed `Tab` the `Total` column wasn't automatically filled
in. To recalculate the total you'll need to move the cursor to the
formula line and press `CTRL+C CTRL+C` 

    | date             | item   | amount | Total |
    |------------------+--------+--------+-------|
    | <2011-10-21 Fri> | Eggs   |   1.20 |   1.2 |
    | <2011-10-22 Sat> | Cheese |   3.90 |   5.1 |
    |                  |        |        |   5.1 |
    #+TBLFM: $4=vsum(@2$3..@$3)

## About that formula...

Formulas in org-mode tables aren't exactly like formulas in
Excel. The formula `$4=vsum(@2$3..@$3)` is a column formula (a field
formula uses `:=`) which says the 4th column will be the sum of the
3rd column through rows 2 to the current row ( `@2` is row 2, `$3` is
column 3). You can read more about formulas and ranges in the
[org-mode spreadsheet manual][2].

One final thing. To make that last column look a little better,
specify that it should display as a floating point number to 2 decimal
places by adding `;%2.f` to the end of the formula.

    | date             | item   | amount | Total |
    |------------------+--------+--------+-------|
    | <2011-10-21 Fri> | Eggs   |   1.20 |  1.20 |
    | <2011-10-22 Sat> | Cheese |   3.90 |  5.10 |
    |                  |        |        |  5.10 |
    #+TBLFM: $4=vsum(@2$3..@$3);%.2f

This is just the tip of the iceberg of what [Org-Mode][1] is capable
of. My one quibble with org-mode (and it's a big one) is that only we
privileged Emacs users can use it. Org-Mode is simply too good not to
be available in every half-decent text editor.

[1]: http://orgmode.org/
[2]: http://orgmode.org/manual/The-spreadsheet.html

## Categories
Plain Text, org-mode, Spreadsheets, Tables, Emacs
