# ScriptCraft: Building cool things using Javascript in Minecraft
## 2013/01/01 22:42

[Update 2013/01/04 ScriptCraft is now available as a CraftBukkit plugin.][cb]

[Update 2013/02/16 ScriptCraft now has its own website][website]

I've been taking the kids to [CoderDojo][cd] sessions at Blackrock Castle on 
Sunday mornings. I can't say enough good things about CoderDojo. Put a 
bunch of kids and computers in the same room with just enough 
guidance/help from grown-ups and magical things happen. Blackrock castle 
is a great venue for CoderDojo - it's already a child-friendly place 
with an emphasis on science and astronomy - there's an observatory atop 
the castle's tower. There's a cafe on the castle grounds that serves 
great coffee and hot chocolate with marshmallows for that mid-morning 
lag. At the Blackrock venue, kids learn HTML, Javascript, Scratch and 
Sketchup but look around and you'll find at least one or two kids on 
Minecraft too. It's all good ;-) 

![Blackrock Castle][bco]
 
Minecraft first got its hooks into me more than 2 years ago. I first 
played it in Sept 2010 (yeah - I'm bragging my early adopter status - so 
what ;-p ) but its hold on me has only grown stronger over time. 
Needless to say I'm hooked. Minecraft fascinates me not so much as a 
player but as a developer. I've recently watched 'Minecraft - The Mojang 
Story'. It's clear from watching the documentary that Notch's 
achievement has gotten the attention of other well-known and respected 
game developers who admire him not only for what he did but how he did 
it. No other game gets my creative juices flowing as much as Minecraft 
does. 

![Cottage Road][cr]

Since recently discovering [Rhino][rh], I've been wondering about the 
possibility of using Javascript in Minecraft - that is - exposing some 
of Minecraft's API via javascript and making it possible to execute 
javascript code at the in-game command prompt and load and run 
player-written scripts. It strikes me that making Minecraft scriptable 
(via javascript) could only be a good thing because it opens up modding 
and scripting to a whole bunch of kids who already know javascript but 
who find the existing modding cycle of 
editing/compiling/reobfuscating/rejarring downright daunting - writing a 
minecraft mod is still something of a black art. Anything that makes 
modding easier can only be good.
 
I had almost 3 weeks of holidays over the christmas period so I needed a 
pet project. I decided to try to get Javascript in Minecraft. The 
project became [ScriptCraft][gh] and it's up on my github. ScriptCraft 
is a Minecraft mod that lets you run javascript in Minecraft. Once the 
mod is installed, launch Minecraft, create a new world and then type

    /js 1+1

The number 2 is printed. Everything after `/js ` is evaluated as 
javascript (using Mozilla's Rhino - Javascript in Java - library). 
Originally my goal was to just get javascript working so that all of the 
Minecraft classes/methods would be exposed via javascript. 
Unfortunately, there are good reasons why this isn't viable. Being a 
good modding citizen means all of the decompiled minecraft code must be 
recompiled and *reobfuscated*. This means that run-time class names and 
method names aren't scripter-friendly so the entire minecraft 
API can't be exposed via javascript. But parts of Minecraft can be exposed via 
custom javascript functions and properties. I've exposed a couple of 
useful functions ...
 
 * `getBlock(x,y,z)` returns the block id and metadata for the block at 
a given position. If no x,y,z coords are provided then the block under 
the cross-hairs (the current selected/targeted block) is used instead. 

 * `putBlock(x,y,z,blockId,metadata)` places a block at the given 
coordinates. Again - if no x,y,z coords are provided then the block 
under the cross-hairs (the current selected/targeted block) is replaced 
with the blockId and metadata provided. 

 * `getPlayerPos()` returns the 
player's x,y,z coordinates and also their rotationYaw (angle at which 
they're looking left/right) which is the direction they're facing. 

 * `getMousePos()` returns the x,y,z coordinates of the currently 
selected/targeted block or null if the player is pointing at thin air. 

 * `load(path_to_script)` will load and evaluate the script specified. If 
no script is specified then a file open dialog is shown so the player 
can navigate to the javascript file they want to load. 

 * `print(object)` will print the specified parameter on the in-game console's window.

... Keep in mind this is Rhino so `alert` , `window` and DOM are not 
available since those objects/APIs only make sense in a browser context. 
Combined with the full expressiveness and power of Javascript, the 
ability to get and put blocks at any location in Minecraft is powerful 
but even so, to use the above functions as-is would require some 
knowledge of 3D geometry. Fortunately, you don't have to use the 
`getBlock()` and `putBlock()` functions - I've provided a wrapper which 
takes care of much of the finickiness of moving about and building in 3D 
space. 

![Link's Beetle - The inspiration for Drone][lb]

ScriptCraft includes a Javascript Drone class which simplifies 
movement and building in Minecraft. It also uses a [fluent API][fl] 
which means Drone methods can be chained together like this...

    /js d = new Drone().up().box('5:1',3,4,7).up(4).right().fwd(3).box('5:2');

... which creates a new Drone object (by default at the cross-hairs 
location), moves it up, builds a box of spruce wood 3 wide by 4 tall by 
7 long, then moves up, right and fwd (to top-center of box) and places a 
single block of birch wood. The above code can be shortened even further 
to just...

    /js up().box('5:1',3,4,7).up(4).right().fwd(3).box('5:2');

... All of the Drone object's methods are also exposed as global 
functions which return Drone objects, so they too can be chained togther 
to make entering statements at the in-game command prompt, less of a 
chore. I've been doing some usability testing with my 11 year old 
daughter - who hasn't yet begun learning javascript - it quickly became 
apparent that having to type `new Drone()` before a method chain was 
error-prone and redundant. Javascript is such a beautiful and expressive 
language - simplifying the API in this way wouldn't even be possible in Java.

![Logo's Turtle][lt]
 
This is the first time I've had to write an API for kids. I can't tell 
you how much fun that is. I won't pretend ScriptCraft's Drone API is 
anywhere near as good as it needs to be. I've borrowed a little from the 
[Logo programming language][lg] (what I can remember of it) and tried to 
apply its 2D movement to minecraft's 3D space to provide a 
javascript-based API that's close to a [Domain Specific Language][dsl] 
for Kids to build cool stuff in Minecraft.

[Update: The Drone API is preloaded when you install the ScriptCraft bukkit mod]<strike>Unfortunately the Drone API doesn't (yet) come pre-loaded with the mod 
so in order to do some serious building the first thing you must do when 
you fire up Minecraft is type...
 
    /js load()
 
... and load either the drone.js file or one of the example_script files 
(which also load drone.js as they depend on it).</strike> Once loaded you can 
create a humble dwelling with the following statement...
 
    /js box0(98,7,3,5).right(3).door().up(3).left(3).prism0(53,5,7)
 
... of course ScriptCraft wouldn't be much fun if it was only used to 
create humble dwellings (even lots of them). ScriptCraft comes into its 
own when building structures which would take time and be tedious to 
build manually. The [fort.js][fort] extension is an example of how 
ScriptCraft's Drone object can be extended so that new more complex 
buildings can be chained. The example `fort()` method can take 
parameters `side` and `height` which specify how long each side of the 
fort should be and how tall it should be. Even more interesting is 
[castle.js][castle] which (literally) builds on fort's code to create 
even larger buildings.

![SimCity 2000][sc2000] 

Ultimately I think the ScriptCraft mod could be used to take building in 
Minecraft to a whole new level. With a full-blown language at the 
Player's disposal, it should be possible to create not just castles and 
forts but entire road networks and cities. It makes it possible for 
Minecraft Server administrators to create interesting places for players 
to come and play. Anyone who played SimCity 2000 in the mid 90s will 
remember the city-planning aspect of that game. ScriptCraft makes it 
possible to begin thinking about Minecraft in the same way.

![Interlocking castles][ic]

I hope ScriptCraft gives kids another excuse to learn 
javascript, and in the process build something cool in Minecraft :-)

[Enjoy!][gh]

[gh]: https://github.com/walterhiggins/ScriptCraft/
[fl]: http://en.wikipedia.org/wiki/Fluent_interface
[lg]: http://en.wikipedia.org/wiki/Logo_(programming_language)
[dsl]: http://en.wikipedia.org/wiki/Domain-specific_language
[fort]: https://github.com/walterhiggins/ScriptCraft/blob/master/example_scripts/fort.js
[castle]: https://github.com/walterhiggins/ScriptCraft/blob/master/example_scripts/castle.js
[ic]: images/castles-interlocking.png
[cr]: images/mc_cr.png
[sc2000]: http://upload.wikimedia.org/wikipedia/en/e/e5/Sc2kscr.png
[bco]: images/bco.jpg
[lb]: images/link_beetle.png
[lt]: images/turtle-logo.jpg
[rh]: cat-index-rhino
[cd]: http://coderdojo.com/
[cb]: ScriptCraft-and-CraftBukkit-Opening-up-the-Bukkit-API-to-Javascript.html
[website]: http://scriptcraftjs.org/

## Categories
Minecraft, Javascript, ScriptCraft