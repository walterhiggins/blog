# Create Minecraft Server Mods using Node.js style modules

## 2014/01/03 14:52

During the past year I've been tapping away at [ScriptCraft][sc] in my 
spare time. In my day job I started using Node.js a couple of months 
back. One of the things I *love* about Node.js is its module system 
which is based on the [CommonJS module spec][cjsmod]. The module system 
used by Node.js is just so simple and elegant and really lends itself to 
thinking about programming in a more modular way. While ScriptCraft is 
aimed at younger programmers (or programmers who just prefer to mod 
Minecraft using Javascript rather than Java), I think modules and 
thinking about code in a modular way *should* be part of any novice 
programming curriculum. Modules shoudn't be an afterthought and 
Node.js's module system is succint and expressive enough to be 
understandable by beginning programmers. At the end of the day the 
difference between these two source files is minimal...

### hello-basic.js (traditional javascript)

    var salutation = 'Hi ';
    function greet( player ){
        player.sendMessage(salutation + player.name);
    }

### hello-module.js (modular javascript)

    var salutation = 'Hi ';
    exports.greet = function( player ){
        player.sendMessage(salutation + player.name);
    };

... In the first example, the `greet` function is a global named 
function and the `salutation` variable becomes a global variable too. In the second example, `exports.greet` is assigned to a 
function expression and the `salutation` variable is private. In a node.js module, everything (functions, 
variables) is private by default. If you want to make something public 
you add it to the `exports` variable which 'exports' all its properties 
for use by others. I've been programming for 26 years and have 
programmed in a lot of languages in that time. The node.js module system 
is the most elegant module system I've yet encountered. It's so good 
that I decided I *had* to have it in ScriptCraft. I did some digging and 
there are a couple of implementations of the commonjs module system , at 
least one or two available for Rhino, but projects like [Narwhal][nw] 
seemed to be too heavyweight for ScriptCraft's needs. All I wanted was 
the bare bones module loader - not the standard module libraries 
('http', 'fs', 'system' etc). Really all I needed was a good working 
`require()` function that adhered to the CommonJS module contract and to be able to 
export stuff using `exports` and `module.exports`. After some hacking, I 
got a bare-bones [module loader][rjs] part working recently. It works in 
Java's javax.scripting JS Engine and conforms to the [CommonJS module contract][cjsmod].
ScriptCraft modules that reside in the `scriptcraft/plugins` directory 
will be loaded automatically at Server start-up and any exports will 
become global variables - this is obviously different from how Node.js 
modules work but it's a convenience for novice programmers who just want 
to write functions and be able to execute them at the in-game or server 
console prompt. Modules in the `scriptcraft/plugins` directory are also 
auto-loaded and auto-globals to be backward compatible with how 
ScriptCraft used to work (all .js files autoloaded at startup - 
dependencies between modules was a bit problematic).

ScriptCraft modules that reside in the `scriptcraft/modules` directory 
behave pretty much identically to Node.js modules. For example to use 
the utils module (which resides in `scriptcraft/modules/utils/`

    var utils = require('utils');
    var player = utils.player('walterh');
    player.sendMessage('Hello ');

... this style of javascript coding should be familiar to Node.js 
programmers and I think it's a good idea to expose younger programmers 
to modules early in the course of learning programming. Thinking about 
how to decompose a big problem (how do I create a complex minecraft mod) 
into smaller problems and solving each problem in turn using distinct 
modules, is a good skill to have and the CommonJS module system is a 
superb tool for thinking about problems in a modular way. Variables, 
Functions, Looping, Conditionals, Modules and the distinction between 
private and public data and functions are all important basic concepts 
in teaching programming. Most of us who learned Javascript had to 
overlook the lack of a module system and the syntactic ju-jitsu required 
to get privacy, but now at least (on the server-side) there's a great 
module system in CommonJS. I'm going to stick my neck out here and 
predict that in the long run, any Javascript framework that doesn't use 
the CommonJS module system will eventually lose out to JS frameworks 
which do use CommonJS modules. 

Things will be better for the Javascript programmers of tomorrow.

[nw]: http://wiki.commonjs.org/wiki/Implementations
[cjsmod]: http://wiki.commonjs.org/wiki/Modules/1.1.1
[sc]: http://github.com/walterhiggins/ScriptCraft
[rjs]: https://github.com/walterhiggins/ScriptCraft/blob/master/src/main/javascript/lib/require.js

## Categories
ScriptCraft, Nodejs, Javascript
