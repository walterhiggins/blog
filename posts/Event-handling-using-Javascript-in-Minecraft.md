# Event-handling using Javascript in Minecraft.
## 2013/01/06 21:42

So I've been really getting stuck into [CraftBukkit][buk] over the 
weekend - a wrapper API around the Minecraft server. It's pretty amazing 
what the bukkit team have done in just 2 years. Bukkit's API is an open 
wrapper around Mojang's proprietary code-base. Because it's java-based 
it can be exposed via JavaScript and other [JSR-223][223] scripting 
languages. Bukkit's API and plug-in deployment mechanism is so good, 
developing plugins for any other Minecraft Framework seems insane. It's 
no wonder Mojang have hired these guys to work on the forthcoming 
official minecraft plugin framework.

The Event handling system used by Bukkit had me scratching my head for a 
while because it makes use of Java Annotations - which I'm not fully up 
to speed on - but I figured it out eventually and have come up with what 
I hope is a sane [javascript API for handling events in minecraft][ev]. 
For example, to have a message displayed when a player breaks a block in 
the game...

    events.on ("block.BlockBreakEvent", function( listener, event ) {
        echo( event.player.name  + " broke a block!" );
    });

... the `events.on` function is used to specify a callback function 
which will be called whenever a certain event occurs in the game. The 
function takes an Event type (which is a class belonging to one of the 
`org.bukkit.event` sub-packages) and a callback to invoke whenever the 
event is fired. If you want an event handler to only execute once, you 
can remove the handler like this...

    events.on("block.BlockBreakEvent", function(listener, evt) { 
        echo( evt.player.name + " broke a block!" );
        evt.handlers.unregister( listener );
    });

For custom events (events which aren't in the `org.bukkit.event` tree)
just specify the fully qualified class name instead. E.g. ...

    events.on ( net.yourdomain.events.YourEvent, function(listener, event ) {
        echo( event );
    });

I'm really excited about [CraftBukkit][buk] and think the combination of 
[ScriptCraft][sc] and CraftBukkit opens up minecraft modding to a much 
wider swathe of programmers. 

[ev]: https://github.com/walterhiggins/ScriptCraft/blob/master/js-plugins/bukkit/events.js
[sc]: https://github.com/walterhiggins/ScriptCraft
[223]: http://jcp.org/en/jsr/detail?id=223
[buk]: http://bukkit.org/

## Categories
Javascript, Minecraft, Bukkit, ScriptCraft
