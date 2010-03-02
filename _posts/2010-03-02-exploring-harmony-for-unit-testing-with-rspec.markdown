--- 
layout: post
title: Exploring Harmony for javascript BDD with RSpec
categories: 
  - bdd
  - javascript
  - eden
date: 2010-03-02 11:54:00 +00:00
--- 
<p class="date">2nd March 2010</p>

We try to BDD all of our production code, but the one area we always seem to struggle with is our javascript. There are various test/spec frameworks for javascript, but we've never quite found one we've been totally happy with.

There's been a fair amount of interest lately in a new ruby gem which allows you to execute javascript against a DOM from within a ruby process. [Harmony](http://github.com/mynyml/harmony) uses [Johnson](http://github.com/jbarnette/johnson/) a ruby wrapper for the [Mozilla SpiderMonkey](http://www.mozilla.org/js/spidermonkey/) javascript runtime.

To get started figuring out how I might be able to integrate harmony into my workflow, I've created a very simple [project](http://gist.github.com/319235) which uses rspec to make some very simple assertions about javascript behaviour.

<script src="http://gist.github.com/319235.js?file=rspec_with_harmony.rb"></script>

The 3rd and 4th specs are probably the most interesting. They show how how you can use an HTML fixture file, and load the javascript you want to test. This feels like a nice way of isolating your javascript, and would probably encourage me to write much more modular javascript.

Please fork the [gist](http://gist.github.com/319235) and play with some more detailed specs.
