# Internal Reprogrammability
## 2013/01/11 09:22

Martin Fowler on the software I've been using almost every day for the 
past 12 years...

> Emacs is an elderly piece of software, dating back to the mid 70's. Its 
> philosophy of allowing people to easily extend it by modifying the live 
> environment is something shared with a few other 
> elderly-but-groundbreaking systems, such as lisp machines and Smalltalk.
>  
> That philosophy seems rarer now. Certainly there are plenty of 
> extensible systems, you can install plugins for browsers like Firefox 
> and editing suites like Eclipse. The whole free/open source movement is 
> about giving you access to the code that runs your machines so you can 
> (in theory) tweak it to your heart's content. But there's a palpable 
> difference between extensions in most of these environments and the kind 
> of reprogramming you do in emacs or Smalltalk. Something about how it's 
> easy to quickly do small modifications, such as the new command I added 
> above. It's also about doing it without leaving the environment - I 
> don't fire up some separate toolchain to add an emacs function, I work 
> within emacs itself.  
> -- [InternalReprogrammability][1]

... Anyone who's had a taste of Internal Reprogrammability wonders why 
all software isn't internally reprogrammable. That - in part - was the 
impetus behind [ScriptCraft][sc], to make Minecraft internally 
reprogrammable. With Bukkit and ScriptCraft, changing game behaviour on 
the fly is simple - edit your script, save it, then type `/js reload()` 
at the in-game console. No need to recompile , package in a jar file, 
restart servers, restart consoles and all of the other overhead that 
makes java development such a pain. Bukkit does a great job of removing 
most of that pain and ScriptCraft eliminates the need to recompile and repackage. 

> If internal reprogrammability is rare for tools aimed at programmers, 
> it's even rarer for tools aimed at non-programmers. I've often wondered 
> if that ought to change. What would come from making more tools exhibit 
> this quality? Would this encourage more people to learn about 
> programming, the better to control the environment that they spend so 
> much time in? This was certainly part of Alan Kay's vision of the 
> dynabook. He saw children not as passive consumers of media, but 
> actively programming their environment.

That's what I hope ScriptCraft will encourage in young people playing 
Minecraft, that the next time they think "Wouldn't it be cool if you 
could do X in Minecraft", they don't go googling for a mod, they write 
the mod themselves.

Here's a prediction: In the future, Applications which *are* Internally 
Reprogrammable will use Javascript as the language for internal 
programming. Java will eventually be relegated to being just a Loader 
for Javascript. Imagine a conversation between Javascript and Java in 
the near future - it will go something like this...
Javascript: There's a good boy Java, I'll take it from here.

[1]: http://martinfowler.com/bliki/InternalReprogrammability.html
[sc]: http://github.com/walterhiggins/ScriptCraft

## Categories
Emacs, ScriptCraft, Javascript