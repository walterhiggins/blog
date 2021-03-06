# ScriptCraft is Moving
## 2014/09/19 06:57

Earlier this month, [CraftBukkit][1] received a DMCA takedown notice from one of its open source contributors. I won't go into the details here but it means that it's highly unlikely there will be further development of CraftBukkit. The rest of the team have left the project and Microsoft just this week purchased Minecraft. CraftBukkit is pretty much dead.

So where does that leave [ScriptCraft][sc]? ScriptCraft is a thin layer of Javascript on top of CraftBukkit. I chose CraftBukkit as the base layer because it is...

1. Server-based 
2. Easy to install
3. Has a sane API. 

All 3 of these are important. I've been looking around for alternatives that meet these 3 criteria and have chosen [Canary Mod][cm] as the next plugin framework which ScriptCraft will be ported to. I've been busy working on the port this week (the few hours I can snatch here and there between work and family commitments). 

Canary Mod's API is very similar to Bukkits which makes porting that much easier. I don't know how long it will take - these things take time. What I do know is that Canary Mod won't be the *only* platform I eventually port ScriptCraft to. 

Since CraftBukkit's demise, a new project has started up [SpongePowered][sp] which looks *promising* but there's not a whole lot of code there just yet. [GlowStone][gs] is also promising - it's been very active lately and is already bukkit compatible so ScriptCraft kinda sorta works already with it. The big one will be the Official Minecraft Plugin API which [I hope][ho] Microsoft will begin working on soon.


[cm]: http://canarymod.net
[1]: http://dl.bukkit.org
[sp]: http://spongepowered.net/
[gs]: http://glowstone.net/
[ho]: http://recode.net/2014/09/16/will-minecrafts-power-users-stick-around-for-minecrosoft-wait-and-see/
[sc]: http://scriptcraftjs.org/

## Categories
ScriptCraft, Minecraft, CraftBukkit, Canary Mod
