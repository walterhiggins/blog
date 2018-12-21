# Minecraft REPL 

## 2013/06/16 10:51

Steve Yegge on the one feature that all great software has...

> First: every great system has a command shell. It is always an integral 
> part of the system. It's been there since the system was born. The 
> designer of the system couldn't imagine life without a command shell. 
> The command shell is a full interface to the system: anything you can do 
> with the system in some other way can also be done in the command shell. 
> Great command shells are a big topic in their own right (most of the 
> essential properties of living systems are, come to think of it.) A 
> rough sketch: a great command shell always has a command language, an 
> interactive help facility, **a scripting language**, an extension system, a 
> command-history facility, and a rich command-line editor. A truly great 
> command shell is an example of a living system in its own right: it can 
> survive its parent system and migrate elsewhere.
>   
> -- [Stevey's Blog Rants: The Pinocchio Problem][1]

ScriptCraft makes use of Minecraft's command shell and is an attempt to 
provide a scripting language for Minecraft. I really hope that when the 
Minecraft devs eventually publish an API, they also turn on the 
Javascript Interpreter that's been embedded in Java since version 6.0. 

I've been hacking away on ScriptCraft and gave a talk about it at 3DCamp 
last month. It was good to talk about it and meet some of the CoderDojo 
mentors (and students) who have already used ScriptCraft or are 
interested in using it. It was great to meet a young programmer who had 
given a presentation on ScriptCraft at his local CoderDojo. Some new 
stuff I've added to ScriptCraft - a new looping method for the Drone 
class which bypasses the need to use `for` loops when building...

    cottage().right(10).times(5)

... will build 5 cottages in a row. You can use the `times()` method any 
number of times in a chain...

    cottage().right(10).times(5).left(50).forward(10).times(6)

... will build a grid of cottages 5 by 6, *all from the in-game command 
prompt* . You can find [more information on this new method 
here][times]. I've also added a new `classroom` module which makes it 
easier for Tutors to turn on and off Scripting for students in a 
classroom environment. You can find out more about the [classroom module here][classroom].

[1]: http://steve-yegge.blogspot.ie/2007/01/pinocchio-problem.html
[times]: https://github.com/walterhiggins/ScriptCraft/blob/master/docs/api.md#dronetimes-method
[classroom]: https://github.com/walterhiggins/ScriptCraft/blob/master/docs/api.md#classroom-module

## Categories
Minecraft, ScriptCraft, REPL, Steve Yegge