# An Open Letter to the Mojang Team

## 2014/01/12 14:25

TLDNR; Please make Javascript a first-class language for developing Minecraft plugins

## A proposal for supporting Scripting in the forthcoming Minecraft Plugin API.

I'm really excited about the forthcoming Minecraft API. Not least
because the people working on it are the same people who created
[Bukkit][buk] so they clearly know a thing or two about creating good
APIs. What would make me even more excited is if Javascript was also
officially supported as a first-class language for writing plugins.
Minecraft has transcended its original medium. It's no longer just a
game. It's a cultural phenomenon and for its huge community of server
admins and modders - a platform. A platform desperately in need of an
official API. The modding community is a ghetto. If you want to get
started modifying Minecraft there is no clear path to doing so. Even
for a seasoned Java developer like myself, it's bewildering and
intimidating getting started. I can still remember those first
overwhelming days last year when I began working on my own Mod
(ScriptCraft). This hurts because if it's tough for a seasoned dev,
imagine how tough it must be for younger people who want to try their
hand at creating their own mods. I'm talking about children and young
adults.

Minecraft has a huge mindshare among children and young adults. It is
the first game that many children play where concepts like
'client-server', 'plugins' and other tech ideas are learned along the
way. Minecraft is being successfully used in Education to teach all
kinds of things. What interests me is using Minecraft to teach
children programming.

Minecraft is written in Java and chances are the forthcoming API will
be a Java-based API. Java is a fine language but some of the language
concepts (Object Orientated Programming, Inheritance), overly verbose
syntax, and tool-chain (IDEs - eclipse, etc) and the need to compile
mean that Java is not an ideal language for those who want to 'dabble'
or test the waters to see if Programming is interesting. The overhead
and learning curve is too steep for younger
potential-programmers. This is where Javascript comes in.

I've taken my kids to a couple of [CoderDojo][cd] sessions over the past 
2 years. CoderDojos are free and open volunteer-led environments which 
provide training in programming for young kids. Kids learn to program 
using [Scratch][sc] and are also taught how to create their own websites 
using HTML, CSS and Javascript. The excitement about programming at 
CoderDojo sessions is palpable. Javascript is a comparatively easy 
language to learn, especially for younger programmers. Anecdotaly I can 
say there's a lot of interest in Modding minecraft at the coderdojo 
sessions I've been to. Kids are learning to program in Javascript. I 
imagine a lot of these same kids would like to use that knowledge to 
create cool Minecraft plugins.

The good news is that Javascript is bundled with Java since version 6,
so any Java-based Application (like Minecraft) can - with a little
effort - expose its API to Javascript. This is how my own Bukkit
Plugin ([ScriptCraft][scr]) works, it provides a Javascript-to-Java
bridge to Bukkit's excellent Server API. ScriptCraft is a
*Meta-Plugin*, a Bukkit Plugin that lets plugin authors write their
own plugins in Javascript. This for example is how you add a new
Bukkit event listener in JavaScript...

    events.playerJoin( function( event ) {
      var player = event.player;
      player.sendMessage('Welcome to ' + server.name);
    });

... It's more succinct than the equivalent Java code and it doesn't
need to be compiled. You just put the code in a `.js` file and drop
the file in a folder and the code is executed whenever a player joins
the server. Java bean setters and getters are optional in Javascript
which is why `player = event.player` and `server.name` works. The only
thing provided by ScriptCraft in the sample code above is the
convenience object `events` which provides a simple way to add
Bukkit Event listeners in Javascript.
Javascript has come a long way and systems like NodeJS with its
adoption of the superb [CommonJS Module System][cjs] mean that
large-scale modular systems can now be written in Javascript with
little additional effort. Again, ScriptCraft has recently adopted the
CommonJS module system so a ScriptCraft plugin (a bukkit plugin which
depends on ScriptCraft) might look like this...

#### spawn.js
    var bkEntityType = org.bukkit.entity.EntityType;
    module.exports = function( location, entityType ){
       var world = location.world;
       world.spawnEntity(location, bkEntityType[entityType]);
    };

... and might be used like this...

#### farm.js

    var spawn = require('spawn');
    var animals = ['COW','PIG','HORSE','SHEEP'];
    exports.spawnAnimals = function( location, count ) {
       var i = 0;
       for (; i < count; i++){
          spawn( location, animals[ i % animals.length ] );
       }
    }

... and at the in-game command prompt (or from another module) you can
use the farmspawn module ...

    /js var farm = require('farm'); farm.spawnAnimals( self.location, 25 );

... This by the way is another great advantage Javascript has over
Java - programmers can 'explore' the game API more easily by executing
javascript (it's interpreted so no need to compile code) at the
in-game prompt.
I realise you're a small team and you're already under a lot of pressure 
to deliver an official plugin API. All I'm asking is that you consider 
Scriptability as an important feature of the API. Since Javascript is 
the only Scripting Engine embedded with Java 6 and 7 anyway, it should 
be possible to add official support. Further down the road, these are 
items on my wish-list for official Javascript support from Mojang...

 * Please don't have any Java-only APIs.  If parts of the API are only
   avaiable to Java and are not exposable through [JSR 233][jsr233],
   then Javascript won't be a first-class language for writing plugins.

 * Please make event listener registration easy in Javascript.  The
   Bukkit API makes use of Java Annotations to make Event Registration
   easy for Java plugin developers. Please make it so event listeners
   in Javascript are just plain old javascript functions (see example
   above and see [ScriptCraft Source Code][scr] for an example of how
   it could be done. Ideally this should be done using a
   Mojang-provided javascript function, not something provided by a
   3rd-party plugin.

 * Please use a module system - preferably [CommonJS modules][cjs]. 
   CommonJS is the module system used by NodeJS where a thriving module 
   ecosystem has sprung up. How cool would it be if Minecraft's Plugin 
   repository was as vibrant and easy to use as npm? Again, there are 
   dozens of open-source implementations of the CommonJS module system 
   including my own [bare-bone implementation in ScriptCraft][scrreq].

 * Please make Javascript evaluation available at the in-game command 
   prompt for Operators. This is a great aid for beginning programmers. 
   Being able to execute javascript expressions right at the in-game prompt 
   is essential for exploratory programming. Make
   autocompletion (TAB-completion) of globals possible. Again see
   [ScriptCraft][scr] for in-game [REPL][repl] and auto-completion implementations.

 * Persistence. This is JavaScript we're talking about so ... JSON in, JSON out. 
   Saving state should be easy for plugin authors.  

        var gameScores = { walterh: 5, sarah: 10, sean: 9, rachel: 6, evan: 11};
        save(gameScores, 'hg-scores.json'); // saves to a hg-scores.json file
  
Most of the above are already present in ScriptCraft today so please
feel free to co-opt the features/source-code - it's all [open source][scr].
To sum up. I wrote the Bukkit ScriptCraft plugin and from day one I saw 
it as just a stop-gap solution until Mojang officially publish a Plugin 
API and hopefully add supporting Javascript functions. I would like 
nothing more than for ScriptCraft to become redundant and for Mojang to 
officially support Javascript as a language to develop Minecraft 
plugins. This would make a lot of young budding developers very happy. A 
Javascript API for Minecraft Plugins would be rocket fuel for young 
minds. The Mojang Team have an opportunity to do something great here. I 
hope you do.

[cd]: http://coderdojo.com
[buk]: http://dl.bukkit.org
[sc]: http://scratch.mit.edu
[jsr233]: http://en.wikipedia.org/wiki/Scripting_for_the_Java_Platform
[scr]: http://github.com/walterhiggins/ScriptCraft
[cjs]: http://wiki.commonjs.org/wiki/Modules/1.1.1
[screq]: https://github.com/walterhiggins/ScriptCraft/blob/master/src/main/javascript/lib/require.js
[repl]: http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop

## Categories
Javascript, Minecraft
