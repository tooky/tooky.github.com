--- 
layout: post
title: Why I think you should go to a code retreat
categories: 
  - coderetreat
  - tdd
  - bletchley park
  - craft
  - eden
date: 2010-03-17 22:51:00 +00:00
--- 
<p class="date">17th March 2010</p>

Last Saturday I went along to the UK leg of [Corey
Haines](http://coreyhaines.com/) [Code Retreat
tour](http://www.coderetreat.com/how-it-works.html). Apart from the early start
it was a really interesting day, and I really enjoyed the chance to
[pair](http://twitter.com/despo) [with](http://twitter.com/morty_uk)
[lots](http://twitter.com/duncanbutler) of new people.

The day was pretty tiring, pairing is always an intense experience, but I
definitely learnt quite a lot. Its amazing how much fun working on the same
problem several times in a row is, and how different approaches affect the way
you think about it. By repeating the problem you allow your brain to concentrate
on how you are solving it, rather than the problem itself. This gives you a
really different perspective and is something I want to explore more.

There were so many things that I took away from the day, some of them are
already changing my approach to building software:

### 45 minutes is a really short amount of time

The format of the code retreat is to work on the problem with a pair for 45
minutes. When the time is up, you delete all your code, and take break. Spend 15
minutes grabbing a coffee, reflecting on what you've done, and finding your next
pair. Rinse and repeat.

Every 45 minute session flew by. Even so, with each pairing I was surprised at
how far we'd managed to get. But what really surprised me, was how useful the
short break and change of partner proved to be. The break gave you a real chance
to reconsider your assumptions. That little bit of perspective was great in kick
starting the next session.

It really surprised me how easy it was to swap pairs. Granted, everybody had
been thinking about the same problem. But everyone was using a different
approach, and sometimes a different language. The context switching didn't seem
to affect anybody. The new combinations brought new ideas and really contributed
to the success of the day.

We've been trying the [pomodoro technique](http://www.pomodorotechnique.com/) at
work. I know I've been a bit resistant to stopping when the timer goes. I always
feel like I should just get the rest of my ideas out before I take break, but
based on my experience at code retreat, I think the short break from the problem
will turn out to be a real benefit. I'm determined to try and do it properly and
see how it works out.

I also want to try and swap pairs more often. I think that the new perspective a
new pair will bring to a problem will really help to come to the best solution.
I'm not sure about every hour, but once or twice a day should be achievable.

### Pairing is a great way to share insights and learning

Leading on from the new perspective a new pair brings is also the amount of
shared learning that happens when your pairing. I learnt something from everyone
I paired with. Not just how to approach the problem, but new things about the
language, the tools. In a team, pairing will really help to bring every team
member up to speed on any new part of the code base or library added. Switching
often will make this happen even faster.

### If you don't need the infrastructure yet, don't build it

Why do you need to build a class to make your first spec pass? Why not just
write the code you need in the spec? Then write the next spec, and the code to
pass it in that spec. As soon as you start to see shared behaviour extract a
method. When specs are using the same state and the same methods extract a
class.

Working like this is _really_ hard, but its amazing how the design you need just
starts to show itself. 

### Look at one behaviour at a time by isolating it using canned responses

Most of the code we write doesn't split up nicely into discreet chunks of
behaviour. We build systems that rely on several pieces all working together to
produce complicated behaviour. Complexity is difficult to define, so to make it
easier we need to try to isolate the part that we're interested in right now.
We can use simple objects that return canned responses, this allows us to
consider only the behaviour we care about now.

### Keeping things really simple is really hard

Corey was continually encouraging us to keep things simple. Its amazing how
often you think your doing something as simply as possible, and then someone
comes along and makes it even simpler. Simple is good, it allows you to work on
one thing at a time, and not get bogged down in things that don't matter _right
now_. 

A lot of the direction at code retreat was about ways to keep things simple, to
specify only the smallest piece of behaviour. Writing the code in the spec at
first, and using 'doubles' to isolate behaviour are both great techniques to
help you do that.

One of the main things I'm taking away from code retreat is to work hard at
writing smaller, more focussed specs.

If there's a [code retreat](http://www.coderetreat.com/) near you I really
encourage you to go along. If there isn't join the
[community](http://coderetreat.ning.com/) and see if there's anyone else who
would be interested in helping get one organised.

I'd like to say thank you to [Corey Haines](http://coreyhaines.com/), the
sponsors [RiveGlide](http://riverglide.com/) and [Eden
Development](http://edendevelopment.co.uk/), all of the attendees, and of course
[Bletchley Park](http://www.bletchleypark.org.uk/) and the [The National Museum
of Computing](http://www.tnmoc.org/) for making the day such a great success.
