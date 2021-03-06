# Nashorn Vagaries

## 2014/06/08 09:52

JavaScript sometimes causes me to doubt my sanity. I spent a good few hours debugging weird behavior in Nashorn's JS engine yesterday. JSON.stringify() wasn't doing what it was supposed to.

In scriptcraft I expose the JS engine as a javascript variable called `__engine` . That is - you can access the JS engine  from javascript itself and do something like this:

    var x = __engine.eval('( { "names": ["tom", "dick", "harry"] } )');

I noticed something odd - An object read this way was not being output correctly by JSON.stringify():

    console.log( JSON.stringify ( x ) )

outputs `"undefined"`. Yet if I construct the same object using JSON.parse:

    var y = JSON.parse( ' { "names": ["tom", "dick", "harry"] } ');

and output it using JSON.stringify() the output is fine. So basically, what I think is happening is that in Nashorn:

    var x = __engine.eval('( { "names": ["tom", "dick", "harry"] } )');

returns an object whose "names" property is a *Java* array, not a JavaScript native array so it can't be stringified by JSON. The subtle differences between Nashorn and JRE7's JS engine are driving me nuts right now.

## Categories
JavaScript, Nashorn, ScriptCraft
