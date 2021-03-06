# Exploding Arrows in Minecraft in < 10 lines of code.
## 2013/01/09 23:57

So anyone who's watched the [Minecraft Documentary][mcd] has seen 
[@notch][n] demonstrating how easy it is for him to add exploding arrows 
to Minecraft while he's running it in Debug mode. It's a compelling 
illustration of just how deep in the codebase he is and just how 
flexible Minecraft is. It's just a couple of seconds in the film - you 
see him tapping away at some java code, then switching back to the game 
to shoot some arrows which explode with the force of TNT when they hit 
their target. I was impressed. So I thought - what better demonstration 
of the power of [ScriptCraft][sc] than to show how just a few lines of 
javascript code can add the same feature.

    events.projectileHit( function(event){
        var projectile = event.projectile;
        var world = projectile.world;
        if (projectile instanceof Arrow && projectile.shooter instanceof Player){
            projectile.remove();
            world.createExplosion(projectile.location,2.5);
        }
    });

[Look on my works, ye mighty, and despair.][gh]

[n]: http://twitter.com/notch
[mcd]: http://www.2playerproductions.com/projects/minecraft    
[sc]: https://github.com/walterhiggins/ScriptCraft/
[gh]: https://github.com/walterhiggins/ScriptCraft/blob/master/bukkit-plugin/experimental/exploding-arrows.js

## Categories
Minecraft, ScriptCraft, Javascript
