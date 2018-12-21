# Mindful Minecraft
## 2013/01/08 10:25

It looks like the humanities people have found out about Minecraft...

> This workshop will investigate the nature of mind as illustrated by 
> Minecraft, its different versions, and content. We&#146;ll take a look at how 
> this game creates a mediated environment for relationship, gives us 
> memes to live by, and points the way toward deeper mindfulness and well-being.  
> -- [Mindful Minecraft][1]

[1]: http://panelpicker.sxsw.com/vote/72

... Is it wrong that I would go to this talk if I were attending SXSW2013 ?
I gave a demo of ScriptCraft at the Blackrock Castle CoderDojo session last sunday morning and got some great questions and suggestions from eager young developers. The talk was followed by an Install-fest. I didn't get to all of the kids who wanted to install ScriptCraft but I learnt a few lessons along the way...

1. One of the kids already had CraftBukkit on his machine but most didn't (as you'd expect). Installing CraftBukkit is relatively easy but there's still a hurdle explaining that you need to run a server. "Wait - What? - But I've already have minecraft installed".

2. Having to install Rhino was a pain - most kids actually had multiple JREs on their machines so having to install Rhino in each jre/lib/ext folder was slow. I've since removed the dependency on a separate rhino install. Now ScriptCraft uses the default `javax.scripts.*` package bundled with JRE 6+ . This greatly simplifies installing ScriptCraft.

3. Having to manually create the js-plugins folder and copy the files from ScriptCraft's scripts folder - well that was a pain too - Yet another thing that had to be done. In this regard, ScriptCraft was different from other bukkit plugins which you just drag and drop into the plugins folder. Now the ScriptCraft plugin for bukkit automatically creates the js-plugins folder and extracts the bundled scripts into it when it's first installed. Nice.

There's nothing like going through the install process with a bunch of kids to make you realise just how difficult it is to install your software. [I hope I've fixed that][sc]. 

[sc]: https://github.com/walterhiggins/ScriptCraft/blob/master/bukkit.md

## Categories
Minecraft, ScriptCraft