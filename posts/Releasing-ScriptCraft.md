# Releasing ScriptCraft

## 2014/02/11 21:38

This is the procedure I use for releasing ScriptCraft - an open source 
side-project which is not in any way mission-critical to anyone but 
still has enough users who care about its reliability...
 
After I've done some testing and verified there are no major bugs and 
the documentation is up to date, I create [a new release on GitHub][gh]. 
GitHub is great, they don't get pissy about your project existing in 
other locations. This is a perfectly grown-up attitude and one which all 
websites should adopt. GitHub don't mind or care if my source-code and 
binaries are also available in their own dedicated website (they are 
<http://scriptcraftjs.org> ). This is totally commendable and one of the 
reasons I love github.
 
Next I upload the binaries and release notes to 
<http://scriptcraftjs.org/download> - ScriptCraft's own dedicated 
website. It's important that ScriptCraft has its own home after all.
 
Finally I upload the [binaries and release notes to Bukkit's site][pb]. Bukkit 
are a bit funny about posting links to anywhere but bukkit. They want to 
be the canonical source for all bukkit plugins and don't like if you 
link to the project's own site or github. Which makes 
<http://dev.bukkit.org/bukkit-plugins/> my last port of call when I 
release a new version of the plugin.
 
Having 3 different locations from which ScriptCraft can be downloaded 
means I can hit a wider audience. Not everyone uses 
<http://dev.bukkit.org/> so providing the binaries and release notes 
elsewhere is important. Plus, if the Bukkit team do get cranky about cross-linking 
(hey it's the web!) to non-bukkit properties and decide to remove 
ScriptCraft altogether, well it's no big deal. I can't understand the 
thinking behind forbidding such links, it reeks of silo thinking.

[gh]: https://github.com/walterhiggins/ScriptCraft/releases/tag/v2.0.4
[pb]: http://dev.bukkit.org/bukkit-plugins/scriptcraft/

## Categories
ScriptCraft
