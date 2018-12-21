# Writing Minecraft Mods in ES6
## 2017/10/28 21:15

![Howling Wolf](images/wolf-howl-public-domain.jpg)

ES6 (the latest and greatest incarnation of the Javascript Language) has been kicking around for a while but I have only recently reluctantly succumbed to its charms. I'm finally - after years of dubious sidelong glances - warming to to ES6's fat arrow functions.

I like ES6 fat arrows for one simple reason - they result in less code, which usually results in more expressive, easier-to-understand code. Let me demonstrate with a before and after comparison.

The following code is a simple ScriptCraft plugin which will cause a wolf howl to be emitted every time a player breaks a block:

    // howling-blocks.js
    var sounds = require('sounds');
    events.blockBreak( function( evt ) {
      sounds.entityWolfHowl( evt.block );			   
    } );

Every event in the Minecraft API is a method of the `events` object so you can attach custom event-handling functions to any event. In the above code, every time someone breaks a block in the Minecraft game, the sound of a wolf howl will be emitted at the location where the block was broken.

Now let's take a look at the ES6 Fat arrow version:

    // howling-blocks.es
    var sounds = require('sounds');
    events.blockBreak( ( evt ) => {
      sounds.entityWolfHowl( evt.block )
    } );
    
It's a couple of characters shorter - there's no need to use the `function` keyword. `function(evt)` is replaced with `(evt) => `.

We can take things further. In ES6 fat arrow functions, if the function takes just one parameter then you can omit the surrounding `()` around the parameter name, and if the function is just a one-liner (one statement) then you can also omit the surrounding `{}` curly brackets, leaving us with just this:

    // howling-blocks.es
    var sounds = require('sounds');
    events.blockBreak( evt => sounds.entityWolfHowl( evt.block ) );

I like this. The intent of the code is made clearer with less syntax in the way. We can take things further again using ES6's `import` statement so the final code looks like this:

    // howling-blocks.es
    import { entityWolfHowl as howl } from 'sounds';
    events.blockBreak( evt => howl( evt.block ) );

It's not quite as simple as the english-like `when a block breaks, howl like a wolf` but it's beginning to look like a DSL (Domain-Specific Language). I'm still not entirely convinced that ES6 is a better language for beginners than Javascript (aka ES5). Most beginners learn by example and will usually get by copy-pasting, then tweaking example code to suit their own needs (Beginners in this case being kids who play Minecraft and are curious about modding/programming). The ES6 example above is definitely shorter (88 characters vs 105 characters) and on the surface it _seems_ like there's less syntax - to a beginner at least.

Anyway, It didn't take as much pain as I thought it would to get Babel and Nashorn to play nicely together (I used babel-standalone) and if you're feeling adventurous you can [grab the latest code][sc] from ScriptCraft's github and try writing Minecraft Plugins in ES6 now. The in-game and server console even support ES6 syntax now (though it's somewhat limited). This will work for example:
[sc]: https://github.com/walterhiggins/ScriptCraft

    /js setTimeout( () => echo('Hello'), 1000)

...but this won't because of how Babel transforms the `import` statement

    /js import { entityWolfHowl as howl } from 'sounds'
    /js events.blockBreak( evt => howl( evt.block ) )


If you want to do something like the above then you'll need to have it all on the one `/js` command like this:

    /js import {entityWolfHowl as howl} from 'sounds'; events.blockBreak(evt => howl(evt.block) )

...or just put it in a module.

A Caveat: ES6 support is not enabled by default. You'll need to run the following command at the server or in-game prompt first to enable ES6 modules and commands:

    /js require('babel-register')

The reason it's not enabled by default is because Babel is quite a large libary (1.8 Mb of JS) and loading and evaluating it takes a fair bit of processing. You _will_ notice your server slows down while it's loading Babel the first time. Fortunately, babel seems to be pretty quick at parsing and transforming javascript.

It was fun adding Babel/ES6 support to ScriptCraft but I'm still on the fence regarding how much I'll use ES6 in ScriptCraft going forward. 

## Categories
ScriptCraft, Minecraft, Javascript, ES6   

