# A Javascript When Function

## 2012/02/20 20:45

    function when(conditionFunc, execFunc, interval){
        if (conditionFunc()){
            execFunc();
        }else{
            setTimeout(function(){ when(conditionFunc, execFunc, interval);}, interval);
        }
    }
    
You have some code which should only execute when a condition is true. E.g. You have code which relies on a javascript library but can't be sure the library has loaded yet and don't want the code to execute until it has. This is common if you have a bookmarklet which injects more than one `<script>` tag or you have code which should only execute when an image or other asynchronously loaded element is present. The `when` construct lets you sleep periodicially until the condition is true, then execute the code. I needed this construct a couple of years ago when I was working on SnapScribe - an online photo book. When I was working on the Markdown pull-quote bookmarklet I found that sometimes the bookmarklet wouldn't work because the javascript library it uses hadn't yet loaded. I knew I'd written something to solve that exact problem and some digging around the Pixenate codebase later, I found it. You might find it useful too. This is similar to the following construct in Java but Javascript doesn't have a Thread.sleep() method...

    while (!condition){
       Thread.sleep(interval);
    }
    execFunc()
    
Use `when` like this...

    function libIsReady(){ return typeof(LIBRARY_NAME) != "undefined" ;};
    function useLib(){ // code which uses LIBRARY_NAME methods };
    // checks if library has been loaded and if so calls function which uses the library
    when (libIsReady, useLib, 2); 

... One thing to be careful of; the `conditionFunc` parameter should be a function not a conditional expression. `when` will accept both but if conditionFunc is an expression it will only be evaluated once so put your conditional expression inside a function and pass that instead.
    
## Categories

Javascript
