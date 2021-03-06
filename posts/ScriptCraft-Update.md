# ScriptCraft Update
## 2013/03/09 17:11

I've been steadily plugging away at ScriptCraft these past few weeks. 
Fixing bugs, adding new functions, improving the documentation. I've 
just uploaded a new version which you can go grab at 
[ScriptCraftJS.org][sc]. What I'm most proud of in this release is that 
AutoCompletion (Tab Completion) has gone from it-kinda-works to 
it-actually-works. AutoCompletion is one of those IDE features most Java 
programmers can't live without. Getting it to work for a live javascript 
environment is fun. To see it in action try the following....

1. Fire up your CraftBukkit/Minecraft Server and connect to it from a minecraft client. 
2. At the in-game prompt type `/js arr` then press the TAB key.
3. The command will change to `/js arrows` 
4. Now at the caret position type `.` (that's a full stop) and press the TAB key again.
5. The command will change to `/js arrows.explosive()`
6. You can cycle through all of the possible *arrows* methods by repeatedly pressing TAB.

... Pretty cool. No? (Side-note: If you're curious about what all of 
these *arrows* methods actually do, just execute one of them and equip yourself with a Bow and 
shoot an arrow to find out). Auto-completion is just one of those 
features that makes exploratory programming that much easier. For 
ScriptCraft, the Auto-Complete feature became a must-have when my two 
kids began arguing over what the arrows functions were called. 
AutoComplete isn't just for professional Java programmers equipped with 
powerful IDEs. Eager young minds, keen to learn programming should have 
as much help as possible from the computer. 

[sc]: http://scriptcraftjs.org

## Categories
ScriptCraft, Programming