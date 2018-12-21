# Frameworkless
## 2014/01/10 09:47
I'm working on a project that uses Angular right now and have for the past two years been using Dojo, so I can feel the allure of frameworkless javascript. This is what moot.it have to say about Angular...

> ...And despite it's been marketed as being simple, the API is huge. 
> Currently there are 147 different sections on the sidebar of their 
> documentation area. That's a big cognitive load. I need an empty table 
> for building stuff.
>  
> And I really don't like to put so much logic in views or wrap my 
> precious code to proprietary "directives" or "filters". The fairly 
> complex logic of Moot is better expressed with plain old JavaScript.
> 
> [Frameworkless Javascript][fj]

... Angular *is* useful but it is a framework written by framework guys 
for framework guys. That is - it assumes you are already something of a 
Javascript adept. It's not a framework for beginners. Directives, 
Controllers, Interceptors, Dependency Injection - don't try to tell me 
any of this is 'easy'. My biggest problem with Angular isn't that it 
does a whole lot of *magic*, it's that you have to understand the 
*magic*. Dependency Injection is magic that looks great on paper but 
I've never come across DI that 'just works' without having to dive into 
the innards of the framework to debug some case where it doesn't 'just 
work'. Spring and Angular are both guilty. DI - particularly in Angular 
- feels like *bad magic*. I've been reading O'Reilly's AngularJS book 
and it irks me how often the word 'Awesome' appears in that book. 
Remember when Computer books just provided references, tutorials and 
sample code and didn't try to tell you how 'awesome' everything is? 
 
Anyway, the problem with arguing the case for using POJOs ( 
plain-old-javascript-ojbects) instead of locking in logic to proprietary 
Dojo Widgets, or Angular Directives or some other framework-provided 
container, is that POJOs in javascript are still a misnomer (at least in 
browser-based js) and defining objects in javascript doesn't come 
naturally if your team are Java people. When it comes to 
objects-oriented programming, javascript seems to suffer the same 
problem as Perl - There's More Than One Way To Do It (TMTOWTDI). 
 
[fj]: https://moot.it/blog/technology/frameworkless-javascript.html

## Categories
Javascript