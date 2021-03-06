# SweetJS 

## 2014/01/10 16:58

I've been playing around with [SweetJS][sj] just for fun. Macros in 
Javascript *seem* like a good idea. They're clever, they reduce 
boilerplate and allow you to write javascript using a cleaner syntax 
(much like CoffeeScript) but I'm not convinced the trade-offs are worth it.
 
One area where sweetjs and coffeescript can make life easier is in 
callback syntax. ScriptCraft uses callbacks for event-handling so you 
might write code something like this in javascript to handle a 
particular event-type...

    events.on('player.PlayerInteractEvent', function( listener, event){ 
       if (event.player.name == 'walterh'){
           event.player.sendMessage('hi');   
       }
    });

... I'm not a big fan of the syntax overhead - the `function` expression 
and closing `})` has always looked ugly to my eye. SweetJS can make this 
look cleaner by defining a macro like this...

    macro on {
      rule { 
        $eventType $listener $event $body 
      } 
      => 
      {   
        events.on ( $eventType ,function( $listener, $event) $body )   
      }
    }

... which would let me write the Javascript event-handling code like 
this ...

    on 'player.PlayerInteractEvent' listener event {  
       if (event.player.name == 'walterh'){
           event.player.sendMessage('hi');   
       }
    }

... which neatly gets rid of the need for that `function` expression, 
parameter boilerplate and trailing `})`. It's cleaner for sure but I'm 
not sure it's really *that* much cleaner. There's a couple of problems 
with using SweetJS or CoffeeScript in ScriptCraft - the big one being 
that ScriptCraft is meant to be a tool for younger programmers to learn 
to program (with the opportunity to build cool stuff or even create 
full-blown mods in Minecraft being the carrot). I can't really stand 
over that claim if I bring CoffeeScript into the mix or - worse still - 
introduce my own custom macros. 
 
Is that really much cleaner than this...?

    events.on('player.PlayerInteractEvent', function( listener, event){ 
       if (event.player.name == 'walterh'){
           event.player.sendMessage('hi');   
       }
    });

I'm going to leave aside the need to compile sweetjs macros into 
javascript and the attendant headaches of writing code in one language 
but debugging it in another. SweetJS might call them 'macros' and 
'hygenic variables' but it still smells like code generation and 
obfuscation to me.

### Update: 2014/05/08

I've since simplified the events API so you can add (and remove) a handler like this...

    events.playerInteractEvent( function( event ){ 
      if (event.player.name == 'walterh'){
        event.player.sendMessage('hi');   
      }
      this.unregister(); // unregisters this function if needed.
    });

... which saves a few characters and simplifies unregistering (which was a pain previously - I didn't even include unregistering code in previous examples). All without resorting to macros or coffeescript. The listener parameter and event parameters swapped places because the listener parameter was rarely used and only for unregistering. It just added noise. It seemed cleaner to just bind the listener function to a behind-the-scenes object with a single `unregister()` method. 

[sj]: http://sweetjs.org/

## Categories
Javascript, SweetJS, CoffeeScript
