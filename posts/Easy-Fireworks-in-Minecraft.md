# Easy Fireworks in Minecraft

## 2013/06/23 18:57

I finally got around to adding fireworks to ScriptCraft. I basically 
cogged the code from a [bukkit forum post][source]. There's a new 
`fireworks` module with a single `firework` method which takes a single 
parameter (of type org.bukkit.Location). Of course, I've also added a 
Drone 'firework' method to make it easy to create a firework. The 
simplest way to create a firework is to point at a block, then type ....

    /js firework()

... Will create a firework of random type and color. If you want to 
create a few fireworks...

    /js firework().fwd(1).times(10)

... will create a firework, move forward one block and repeat the 
process 10 times. Fireworks have also been added to the `arrows` module 
so now you can equip yourself with a bow, then type...

    /js arrows.firework()

... and start shooting arrows to your heart's content. You can see the 
results in the video below...

[Fireworks using Scriptcraft](http://youtu.be/DJxPPk9ODiE)

You can [download the ScriptCraft plugin here][sc].

[source]: https://forums.bukkit.org/threads/spawn-firework.118019/
[sc]: http://scriptcraftjs.org/

## Categories
ScriptCraft, Minecraft, Fireworks
