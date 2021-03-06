# Setting up a peaceful MineCraft Multiplayer server using Amazon EC2
## 2011/09/06 16:05:00 

![minecraft animals](images/mc-animals.png)

MineCraft and Amazon EC2 - 2 flavours that taste great together. Me and 
the Kids love MineCraft but until recently have only ever played it in 
Single Player mode. I recently setup a multiplayer server on one of our 
machines but thought it would be nice to have a dedicated MineCraft 
server. I'm not going to put it on my walterhiggins.net server because I 
don't have Java installed on the server and MineCraft is a bit of a CPU 
hog. EC2 to the rescue.

- Get yourself an Amazon Web Services account if you haven't already done so. If you're already an amazon customer this should be straightforward. Just go to [aws.amazon.com][1]

- Go to the web-based [EC2 admin console][2]

- Click the **Launch Instance** button.

- Follow the instructions to create the Instance **Basic 32-bit Amazon Linux AMI 2011.02.1 Beta** and create a new Key-pair.

- Connect to the instance using [putty][3] or ssh (It's a bit convoluted for Windows users but easier on Linux) - You need to use the .pem file you downloaded when you created the key-pair in the previous step.

- At the instance's command prompt... `mkdir minecraft` then  `cd minecraft` then  `wget ` [http://www.minecraft.net/download/minecraft_server.jar][4]

- Create a script called minecraft.sh with the following content:
  <pre><code>#!/bin/sh
cd /home/ec2-user/minecraft
java -Xmx512m -Xms512m -jar minecraft_server.jar nogui</code></pre>
    
- `chmod a+x minecraft.sh`

- To have minecraft server process automatically start when the server is 
  started or rebooted, add the following to /etc/rc.d/rc.local: 
  <pre><code>sh /home/ec2-user/minecraft/minecraft.sh</code></pre>

- Make your server peaceful (don't spawn mobs) and give yourself ops (admin) privileges. Edit /home/ec2-user/minecraft/server.properties (if this file isn't present yet, then just start the minecraft server by executing minecraft.sh). Set `spawn-monsters=false`. Set `ops={YOUR_MINECRAFT_LOGIN}`.

Reboot the instance and you're done. You now have a dedicated minecraft 
server you can turn off and on using Amazon's web-based EC2 console (you 
probably don't want it running constantly if it's for a small group - 
EC2 costs $0.085/hour).

I'm thinking of working this into something like an introduction to 
cloud computing for kids.

footnote 1: Amazon EC2 has come a **long**&nbsp;way since it first launched 5 
years ago with just a handful of command-line tools. The web console is fantastic.

footnote 2 from [Kyle Maxwell][5] : you'll need to add a firewall rule 
(look under Network & Security > Security Groups) for Custom TCP Rule, 
entering 25565 for the Port Range so that the server will allow 
connections on the port the Minecraft server application users.

[1]: http://aws.amazon.com
[2]: https://console.aws.amazon.com/ec2/home
[3]: http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
[4]: http://www.minecraft.net/download/minecraft_server.jar
[5]: http://twitter.com/KyleMaxwell

## Categories
amazon, cloud, computing, ec2, minecraft, 