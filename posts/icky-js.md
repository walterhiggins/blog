# icky.js 
## 2018/10/12 12:37

[icky.js][lnk] is a small side-project that evolved from a feeling I've been harbouring about front-end programming for some time now:

You don't need a framework.

The problem with harbouring such a thought is that it's heretical. No
one takes such an opinion seriously these days.  Large-scale webapps
built by teams of developers **need** a framework or they become
unmaintainable messes. So says popular wisdom.

Front-end frameworks make web-programming _easier_ they say. Front-end
frameworks make developers more _productive_.  Front-end frameworks
provide useful abstractions so developers don't need to get bogged
down in the low-level details.

And yet, such frameworks - rather than getting out of the way so you
can focus on your _Application_ code - tend to stay front-and-center
so you always have to think about your application in a
framework-centric way.  Consider Angular and its Directives,
Controllers, Services and myriad other "abstractions" that force you
to write your code in an Angular-centric way. This wouldn't be so bad
if Angular's internals didn't disgorge themselves on a regular
basis. Try working through an Angular stack trace or debugging
Angular's digest cycle and then tell me again how "awesome" Angular
is.

React "is just javascript" but has spawned endless discussions about state management libraries and React's component lifecycle hooks. 

[https://twitter.com/philippspiess/status/1048242543354417152](https://twitter.com/philippspiess/status/1048242543354417152)

Chances are, if you're using a modern Javascript framework "You're doing it
wrong &#153;" and should rewrite your code to use whatever is this week's flavor
of best practice. This is part-and-parcel of Javascript frontend
programming today - the constant anxiety of knowing that your code is
bad and you should feel bad.

Lost in all of this is the simple truth that Application code should
_look like_ Application code. Your application code should be easy to
reason about. It should be easy to understand and change if needed. A
Framework should _work in the service of_ your Application but if you
look at a typical Framework-based Application's code-base you'll see
that the opposite is often true. A single Application feature is
typically scattered across multiple framework artifacts. During my time using
Angular (2013 - 2017) I had the constant nagging feeling I was writing
"Angular" code, not Application code. This is a far cry from
frameworks in the 90s (MFC, JFC, Delphi) which for the most part stayed out of the way and just
helped you do your job.

[icky.js][lnk] is a reaction to the constant belittlement of any way of frontend coding which doesn't employ best-of-breed enterprise-class scalable front-end methodologies. 
It's a library. It doesn't require a build system. It's just one (rather tiny) file. You [don't even have to host it yourself][cdn].

It embraces the use of ES6 Template literals ( overlooked largely because of the success of JSX &macr;\_(&#12484;)_/&macr; ). 
It's remarkable that an ES6 feature long absent from Javascript ( Template Literals. AKA clean multi-line strings ) has not been hyped more. 
Constructing snippets of HTML markup is now 1,000% less painful thanks to ES6 but all the cool kids think JSX is great.

[icky.js][lnk] harks back to the idea that Application code should
_look like_ Application code. It gets out of the way and lets you use
clean ES6 code. It's not a MVC framework. It's not even the V in
MVC. It's just 3 functions which you might find useful when writing a
webapp.

[snip1]: https://github.com/walterhiggins/ickyjs/blob/master/docs/examples/todo-list/app.js#L250-L270
[cp1]: https://codepen.io/walterhiggins/pen/ReZbyw

Take the following [snippet of code][snip1] which is taken from the [To-Do sample application][cp1]:

    const onClickClearCompleted = gnf(() => {
      model.completed().forEach(model.remove);
    });
    const tClearCompleted = () => `
    <button class="clear-completed ${model.completed().length ? "" : "hidden"}" 
            onclick="${onClickClearCompleted}()">
      Clear completed
    </button>`;
  
    on(
      TOPIC.ITEMS_LOADED,
      TOPIC.BULK_STATUS_CHANGE,
      TOPIC.ITEM_STATUS_CHANGED,
      TOPIC.ITEM_REMOVED,
      () => update("#clearCompleted", tClearCompleted)
    );
    
It describes a component (a Button which appears when there are 1 or more completed to-do items) which can clear (remove) completed items. 
There are many possible actions a user can perform which decide whether or not the component should appear.
The Component's appearance (**View**) is specified:

    const tClearCompleted = () => `
    <button class="clear-completed ${model.completed().length ? "" : "hidden"}" 
            onclick="${onClickClearCompleted}()">
      Clear completed
    </button>`;
  
Its controller logic (how it updates the model) is specified:

    const onClickClearCompleted = gnf(() => {
      model.completed().forEach(model.remove);
    });

And the rules governing when the component's view should be updated are specified:

    on(
      TOPIC.ITEMS_LOADED,
      TOPIC.BULK_STATUS_CHANGE,
      TOPIC.ITEM_STATUS_CHANGED,
      TOPIC.ITEM_REMOVED,
      () => update("#clearCompleted", tClearCompleted)
    );

All of this is done in just a few lines of code. Importantly - the View,
Controller and logic governing when the view should be updated are
_co-located_ in the same block in the same file meaning it's easy to
understand the component. This - in my humble opinion - is how all
Application code should be constructed. There is no Framework code here. The entire app is in [a single file][app].

Its size (a puny <100 loc) means icky.js will never be a serious
contender in the world of Javascript front-end programming but writing
it and using it has been cathartic and has helped me rediscover the
joy of front-end programming.

[lnk]: https://walterhiggins.github.io/ickyjs/
[cdn]: https://rawgit.com/walterhiggins/ickyjs/master/icky.js
[app]: https://github.com/walterhiggins/ickyjs/blob/master/docs/examples/todo-list/app.js

## Categories
javascript, programming, web, es6
