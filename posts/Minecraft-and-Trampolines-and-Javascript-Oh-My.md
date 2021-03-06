# Minecraft and Trampolines and Javascript Oh My!

## 2015/02/15 16:50

This has nothing to do with Reginal Braithwaite's [Trampolining in Javascript][tr]. Just a fun
experiment I've been working on for a forthcoming ScriptCraft Workshop.

The goal of the workshops is to whet kids' appetite for programming. Kids aren't necessarily interested in programming for its own sake but they sure are curious about Minecraft and Modding and making cool stuff.

In the upcoming workshop I'm going to do the usual introduction - some basic building functions. The `self` variable and properties (self.name - the player's name, self.motionY * 2 - sets the player flying into the air) and some basic maths in javascript (addition, multiplication - the usual).

The `/js self.motionY = 2` statement usually elicits a few oohs and aahs because it gives immediate visual feedback (See Bret Victor's [Inventing On Principle (skip to 10:00)][br]). 

Maths on its own can be hard to engage with but if you take Muliplication and combine it with something like the Player.motionY property you can see how the principle of multiplication applies to trampolines. When you first step into a trampoline, the first jump is small but as you jump higher and higher there's a multiplier effect as each consecutive bounce makes you bounce higher. 

The workshop will take the kids step by step through the process of adding a new object to the game - a Trampoline. The kids will choose which material/block-type should be used for the trampoline - two good candidates are Sponge and Slime but participants can choose something else if they like. 

Initially the trampoline won't actually be bouncy. Once the trampoline() function is added, kids jump aboard but will probably be disappointed because it doesn't behave like a trampoline - there's no 'bounce'. This is where I explain Event-Driven Programming - Events or 'Hooks' are ways to tell the game you want it to run some code when a particular thing happens, such as when a player breaks a block or a player moves. 

So I introduce a `maybeBounce()` function which will be called when the player moves. The 1st draft of the function checks to see if the player is standing on a bouncy block (slime or sponge or whatever) and 'bounces' the player in the air by setting their `motionY` property. 

The next phase is to improve the trampoline behavior. Initially players all jump the same height no matter how many times they bounce. This is where multiplication comes in - I'll explain how multiplication can be used the make the in-game trampoline more realistic - each successive bounce will be higher than the last. 

I like this workshop because it covers objects and properties ( the `self` player object and their `.motionY` property ), event-driven programming and - crucially - how Maths can be applied to improve gameplay.

The final draft of the workshop code is embedded below.

<script src="https://gist.github.com/walterhiggins/59a964996fc335406ec0.js"></script>

[tr]: http://raganwald.com/2013/03/28/trampolines-in-javascript.html
[br]: https://vimeo.com/36579366

## Categories
Minecraft, Javascript, ScriptCraft
