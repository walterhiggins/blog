# Anatomy of a ScriptCraft Plugin

## 2013/01/23 00:58

So this christmas project... it's grown legs. I've been working on 
[ScriptCraft][sc] late most nights and haven't really had a chance to talk 
about what I've done so here goes....

ScriptCraft has evolved a little from it's early MCP-only incarnation 
where you could only use it for building stuff in minecraft, into 
something much more. I've switched from MCP (Minecraft Coder Pack) to 
Bukkit because bukkit has a sane API and the bukkit guys have been hired 
by Mojang to work on the upcoming official plugin API so chances are 
there won't be too much breakage for existing bukkit plugins. The remit 
of ScriptCraft has expanded so that you can do more than just build - 
you can do anything you like - Custom Event handling, mini-games, 
interactive/dynamic signs, easy signage (text written using minecraft 
blocks), - anything you can do using a java-based plugin, you can do it 
faster and easier in Javascript with the ScriptCraft plugin. To 
demonstrate this, I've recreated a commonly-used mod (homes) in 
javascript. The `homes` javascript plugin lets players set their current 
location as home and return to that location using in-game commands. 
They can also visit other players' homes. It's a simple plugin that 
demonstrates a couple of new features in ScriptCraft ...

 * Persistence

 * Adding Player (non-operator) commands

... First persistence. Persistence is the ability to retain state after 
the server has shutdown and started up again. Persistence is something 
you get for free if you create your javsacript plugin using the new 
`plugin()` function provided with ScriptCraft - just keep any data you 
want to save in a property called `store` and that data will be written 
and read at shutdown and startup. The data is persisted in JSON form so 
it's even somewhat human-readable. Declaring a new plugin is easy, you 
give your plugin a name, specify an interface/object and whether the 
plugin should be persistent. For this I'm going to create a new plugin 
called "chat" that will let players change the default color of their messages 
in the in-game chat window...

    plugin("chat", { 
        setColor: function(player,chatColor) { 
            this.store.players[player.name] = chatColor;
        }
    }, true);
    // initialize the store 
    chat.store.players = chat.store.players || {};

The above code doesn't do a whole lot other than let operators set a 
player's color choice ( `/js chat.setColor(__self, "green")` ). A little 
bit more code has to be added so that the player's text color will 
change when chatting with other players, but the above code will ensure 
the player's color setting is at least saved. The following code just 
ensures that when a player chats , the text will be displayed in their 
chosen color...

    ready(function()
    {
        var colors = ["black", "blue", "darkgreen", "darkaqua", "darkred",
                      "purple", "gold", "gray", "darkgray", "indigo",
                      "brightgreen", "aqua", "red", "pink",
                      "yellow", "white"];
        var colorCodes = {};
        for (var i =0;i < colors.length;i++) colorCodes[colors[i]] = i.toString(16);
        
        events.on("player.AsyncPlayerChatEvent",function(l,e){
            var player = e.player;
            var playerChatColor = chat.store.players[player.name];
            if (playerChatColor){
                e.message = "&sect;" + colorCodes[playerChatColor] + e.message;
            }
        });
    });
        
The `ready()` function takes a callback and ensures that the function 
supplied will not be invoked until all of the javascript functions have 
loaded. It declares a lookup table of colors / names and adds an event 
handler which intercepts and inserts color codes into player's text 
messages. The `events.on()` function comes courtesy of the `events` 
plugin so that's why event handlers for a plugin should usually only be 
loaded inside a `ready()` callback.

The other new addition to ScriptCraft is the `/jsp` command - this lets 
operators expose plugins for use by regular players. To be clear, `/jsp` 
does not do any javascript evaluation, it just accepts parameters which 
are then passed on to the appropriate javascript plugin. So far in this 
example plugin we haven't provided any way for regular players to - you 
know - actually set their text color of choice - only operators can do 
this for a player using the `js chat.setColor(...)` javascript 
statement. Let's be clear - giving your players access to the whole API 
via javascript isn't a good idea. So how do you safely let players 
choose their text color? If you've written a javascript function and 
want players to be able to use that function, you expose it using the 
new `command()` function like so...

    command("chat_color",function(params){
        var color = params[0];
        if (colorCodes[color]){
            chat.setColor(__self,color);
        }else{
            __self.sendMessage(color + " is not a valid color");
            __self.sendMessage("valid colors: " + colors.join(", "));
        }
    },colors);

... The above code adds a new *subcommand* to the `/jsp` command and 
also specifies autocomplete options (the last parameter - `colors`) for 
that command when the player presses the `TAB` key. Now the player 
themselves can change their chosen chat color like so...

    /jsp chat_color yellow

... What I've done here is create a new plugin which lets players choose 
a chat color and saves that preference when the server shuts down and 
starts up. I've also added a new `jsp` sub-command - `chat_color` that 
players use to change their chat color setting. The full plugin source 
code is just a couple of lines of code but is a fully working plugin...

    // declare a new javascript plugin
    plugin("chat", {
        setColor: function(player, color){
            this.store.players[player.name] = color;
        }
    },true);
    // initialize store
    chat.store.players = chat.store.players || {};
    // when the 'events' module is ready ...
    ready(function()
    {
        var colors = ["black", "blue", "darkgreen", "darkaqua", "darkred",
                      "purple", "gold", "gray", "darkgray", "indigo",
                      "brightgreen", "aqua", "red", "pink",
                      "yellow", "white"];
        var colorCodes = {};
        for (var i =0;i < colors.length;i++) colorCodes[colors[i]] = i.toString(16);
        
        events.on("player.AsyncPlayerChatEvent",function(l,e){
            var player = e.player;
            var playerChatColor = chat.store.players[player.name];
            if (playerChatColor){
                e.message = "&sect;" + colorCodes[playerChatColor] + e.message;
            }
        });
        command("chat_color",function(params){
            var color = params[0];
            if (colorCodes[color]){
                chat.setColor(__self,color);
            }else{
                __self.sendMessage(color + " is not a valid color");
                __self.sendMessage(colors.join(","));
            }
        },colors);
    });
    
![Chat Color plugin][1]

... this is what I would call a minimum viable plugin and it 
demonstrates some of the new features of ScriptCraft - persistence 
(automatic) , event handling, and exposing new functionality to players 
using the `/jsp` command. I hope this will give potential MineCraft 
modders a feel for just how easy it can be to change the game to suit 
their needs. I have a lot of things I want to do with and using 
ScriptCraft, but I also want to circle back to the educational side and 
spend some more time working on the Young Person's Guide to programming 
in Minecraft. If you've read this far, I hope you've found it helpful.
You can [download the ScriptCraft Plugin here][dl].

[1]: images/scriptcraft-chat-color.png
[sc]: http://github.com/walterhiggins/ScriptCraft/
[dl]: files/scriptcraft/
## Categories
ScriptCraft, Minecraft
