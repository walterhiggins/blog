# Rhino - The most fun you can have with a JDK

## 2012/09/06 00:50

More programmers should know about [Rhino][0]. I should do something about
that. I *would* do something about that if I had a widely-read
programming blog but I don't so I'll just post some thoughts here.
Rhino has been around a long time. I first heard about it when I began
programming in Java 13 years ago. All I knew about it at the time was
that it was Javascript in Java. "Who'd want that?" I thought. I was
young and foolish and ignorant of Javascript's beauty.
Fast forward to present and Rhino is still around - it hasn't gone
away but it doesn't get the nerd-love that [Node.js][3] gets. Which is a
pity because Rhino is the dog's bollox.

Rhino is duct tape for Java. It's glue. It's the most hacktastic,
non-enterprise, itch-scratching, programming fun you can have with a
JDK. It puts the fun in Java programming where previously there was
only AbstractFunFactory. Rhino is lowercase fun. It's lowercase
java. It's something of a guilty pleasure. What I'm trying to say is I
*really* like Rhino. This is surprising because I hadn't really paid
much attention to it - ever.

So Rhino is Javascript implemented in Java, with all of the java API
available to it. This turns out to be really useful. Especially if you
use ANT to build projects and need to do some custom build job that
Ant's built-in tasks can't handle. This Ant macro should be in every
build.xml file if you need to lean on Rhino to do something Ant alone
can't do...

    <macrodef name="rhino">
        <attribute name="script">
        <element name="script-params" implicit="yes"/>
        <sequential>
            <java jar="${path-to-jdk}/lib/js.jar" failonerror="true" fork="true">
                <arg file="@{script}"/>
                <script-params/>
            </java>
        </sequential>
    </macrodef>

... in your build.xml file, when you want to use Rhino to execute a
javascript script do it like this...

    <rhino script="path-to-script.js">
        <arg value="arg1"/>
        <arg value="arg2"/>
    </rhino>

... where the `<arg>` elements are optional. Yes I've seen examples on
the web of embedding javascript directly in a build.xml file using a
script element and I know that this is supported in the latest and
greatest Ant but I don't have that. And besides, I like to keep
javascript in a separate .js file so I get the benefit of syntax
highlighting in my editor.

The beauty of Rhino is it gives you the best of both worlds; the power
and reach of Java's humungous API - and the expressiveness and
fluidity of Javascript. Oh and you also get to use Javascript
libraries too!

A couple of days ago I posted on [github][1] a bare-bones (and I
really mean 'bare-bones' - it makes no effort to find matching lines)
implementation of Unix's `patch` utility in Javascript. For me the
most interesting thing isn't the patch code itself but the
accompanying [rpatch.js][2] file which demonstrates how to use the
SXOOP.read_patch function from Rhino.

In an ANT build.xml file I might call the rpatch.js script like
this...

    <rhino script="rpatch.js">
        <arg value="acme-widget.c"/>
        <arg value="bugfix-29222-acme-widget.patch"/>
    </rhino>

... the combination of Rhino and Ant opens up a lot of possibilities
for easily creating custom ant tasks. 

There is the question of why I'd want or need to write an (admittedly
naive) implementation of `patch` in javascript. I could offer a couple
of reasons but ultimately I did it because it was fun.

[0]: https://developer.mozilla.org/en-US/docs/Rhino
[1]: http://github.com/walterhiggins/sxoop-patch
[2]: https://github.com/walterhiggins/sxoop-patch/blob/master/rpatch.js
[3]: http://nodejs.org/

## Categories
Rhino, Javascript, Ant
