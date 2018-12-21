# Teleporting Arrows in Minecraft

## 2013/01/10 19:04

Just a quick video and code demonstrating how to add teleporting arrows to Minecraft. The code is quite small and easy to add to any CraftBukkit Server which has the ScriptCraft mod installed.

[Teleporting Arrows](http://youtu.be/U_CIEWrC1m0)

    load(__folder + "bukkit/events.js");
    
    importPackage(org.bukkit.entity);
    importPackage(org.bukkit.event.player);
    
    bukkit.on("entity.ProjectileHitEvent", function(listener, event){
        var projectile = event.entity;
        var world = projectile.world;
        if (projectile instanceof Arrow && projectile.shooter instanceof Player){
            projectile.remove();
            projectile.shooter.teleport(projectile.location,
                                        PlayerTeleportEvent.TeleportCause.ENDER_PEARL);
        }
    });

    
## Categories
ScriptCraft, Minecraft, Javascript
