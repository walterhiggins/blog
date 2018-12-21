# CanaryMod and ScriptCraft Quick-Start
## 2015/01/31 21:56

CanaryMod has a lot of configuration options and its default 
configuration is very restrictive (compared to say - Bukkit; but there 
are good reasons for this - CanaryMod has built-in permissions 
management so it make sense that the default config is hardened). For 
example, players who join a canarymod server automatically belong to a 
'visitors' group which has very few permissions. Visitors can't build or 
break blocks.
 
I recently added a new `slash()` module/function to ScriptCraft which 
lets plugin authors run other commands from their scripts. For example 
to create a startup script that grants extra permissions to visitors, 
create a file called init.js in the scriptcraft/plugins directory:

<script src="https://gist.github.com/walterhiggins/67b64677e2c7a50a652d.js"></script>

The above script will let visitors build and also execute javascript. It will
also give opreator privileges to any players who join the game.
You definitely don't want to allow this unless you're working with your 
own server and are only sharing with trusted friends.

There are a couple of other configuration changes you'll probably want 
to make to CanaryMod if you plan to use ScriptCraft for building or want 
to have a creative server. The following entries in the 
config/worlds/default/default_NORMAL.cfg file will make a flat world 
(good for building) with no monsters or villagers and with a default 
game mode set to CREATIVE.

    world-type=FLAT
    spawn-protection=0
    spawn-villagers=false
    spawn-monsters=false
    gamemode=1
    forceDefaultGameMode=true
    
You'll need to delete the worlds/ directory after you've made these 
changes so that CanaryMod will generate a new world with these settings.
 
## Categories
ScriptCraft, CanaryMod, Minecraft