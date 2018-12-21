# Arduino and Minecraft sitting in a Tree

## 2014/01/21 23:34

So I bought an Arduino last Sunday afternoon and spent a pleasant few 
hours with my eldest setting up simple circuits and even running our 
first Arduino program. We got much further along than I had hoped. I'm 
new to electronics and circuitry - I know I know (hangs head in shame), 
so it was as much a learning experience for me as it was for my 
daughter. I hoped to get the Starter Kit but Maplin didn't have them in 
stock so I bought a basic Uno board, some push-buttons, LEDs, resistors, 
photo-resistors (LDRS or light-dependent resistors), wires and a 
breadboard and a USB cable. The total cost ran to about 90 Euro but it 
was money well spent. 

## Getting started

If you want to get started on messing with Arduino, go watch the man
himself Massimo Banzi on Youtube.

[Arduino Tutorial](http://youtu.be/2X8d_r0p92U)

## Arduino and Minecraft

What prompted this sudden interest in Arduino was [a thread on the 
ScriptCraft Group about using Arduino to send and receive 
messages/events from Minecraft][scgr]. My first sighting of Arduino was 
at local CoderDojos. My kids seemed to know more about them than I did (I 
never - until recently at least - had much of an interest in 
Electronics). Anyway it seemed that wiring an Arduino with some 
real-world sensors up to Minecraft might be an interesting project. This 
is my first foray into this area. Consider this the `Hello World` of 
Arduino/Minecraft interaction.

[Arduino and Minecraft](http://youtu.be/VPSBY9WUVHg)

... it's a somewhat contrived example of real-world / virtual-world 
interaction (a real-world 'button' is no different to a keyboard button after all) 
but it demonstrates how sensors attached to an arduino (which can be 
remotely connected over wifi with a wifi shield) can trigger events in 
the Minecraft game. This all being based on [ScriptCraft][sc] and using 
Arduino hardware, the [source code and instructions for setting this 
up][source] are on github of course. Under the hood, it's using [MQTT - 
Message Queue Telemetry Transport](http://mqtt.org) - a lightweight 
protocol machines use to natter amongst themselves. It's a pub/sub 
mechanism aimed at resource-starved machines and it's part of [The 
Internet of Things][iot]. Needless to say, I like it. 
 
There's plenty of potential for some interesting two-way interaction 
between Minecraft and Arduino-based contraptions. I can't wait to see 
what others do with this.

[sc]: https://github.com/walterhiggins/ScriptCraft
[source]: https://github.com/walterhiggins/scriptcraft-extras-mqtt/tree/master/sketches/example-1
[iot]: http://en.wikipedia.org/wiki/Internet_of_Things
[scgr]: https://groups.google.com/d/msg/scriptcraft---scripting-minecraft/JfkL1Q8MGKg/YVWDJ7v2c8UJ

## Categories
Arduino, Minecraft, ScriptCraft
