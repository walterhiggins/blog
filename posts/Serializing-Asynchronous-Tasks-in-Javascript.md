# Serializing Asynchronous Tasks in Javascript
## 2017/03/29 08:43

You have an Array and an asynchronous task which must be performed on each element in the array. You want the array to process _in series_. That is - each item in the array is only processed _after_ the previous item has been processed.  
You're using Node.js or a system with the same callback conventions/signature.
    
    function series( array, asyncOp, done){
      var len = array.length,
          results = [];
      if (len == 0){
        if (done) {
          done(null, []);
        }
        return;
      }
      
      function each(n){
        asyncOp(array[n], function(err, result){
          results.push(result);
          if (err){
            done(err,result);
            return;
          }
          if (n < len -1 ) {
            each(++n);
            return;
          } 
          if (done) {
            done(null, results);
          }
          return; 
        });
      }
      each(0);  
    }

Let's create a silly asynchronous function to demonstrate:

    function lazyOp( item, next ){
      setTimeout(function(){ 
        console.log(item);
        if (typeof next == 'function'){
          next(null, item);
        }
      }, Math.random() * 2000);
    }    

This function will print the item after a random period of time (somewhere between 0 and 2 seconds). If we were to run this lazyOp over an array using `forEach()` the items would be processed out of order:

    [ 1, 2, 3, 4, 5].forEach(lazyOp);

The results might look like this:

    5
    3
    2
    1
    4

Whereas if we run them using the `series()` function above:

    series([ 1, 2, 3, 4, 5], lazyOp);

Each item in the array is guaranteed to be processed in order.

    1
    2
    3
    4
    5

In NodeLand, most operations are _asynchronous_. That is, they do something and _tell you when it's done_ via a callback function you provide - these operations are usually subject to the vagaries of network or other latencies. Sometimes you want things done in a certain order so being able to guarantee the order in which operations is important.

Isn't there already a NPM package that will do this? Why [of course][async] but it was interesting to work out in code how to go about implementing such a function from scratch. It scratched an itch. Sometimes it's fun to just take a problem and start coding - taking a rough, hazy line of thinking, and distilling and crystalizing it in to working code.

[async]: https://caolan.github.io/async/docs.html#series

Update: Using async.series

As mentioned earlier, there _is_ an open-source module which lets you do this. The `async.series()` function takes a list of _tasks_ (functions) and performs each in series. If we were to use this to perform the same operation over an array in series, it would look something like this:

    var series = require('async').series;
    var tasks = [1, 2, 3, 4, 5].map(function(item){
      return function(callback){ 
        lazyOp(item, callback);
      };
    });
    series( tasks );

Can this code be improved and/or made succinct? It's javascript - of course it can.

## Categories
Javascript, Programming