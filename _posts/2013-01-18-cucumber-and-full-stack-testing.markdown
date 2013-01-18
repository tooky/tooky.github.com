---
layout: post
title: Cucumber and Full Stack Testing
categories:
  - bdd
  - atdd
  - cucumber
  - fitnesse
date: 2013-01-18 15:55:00 +00:00
---
<p class="date">18 January 2013</p>

There has been two similar questions asked on two different mailing lists
I subscribe to (Corey Haines'
[BAWCH](http://www.cleancoders.com/codecast/bawch-episode-1/show "Build an app
with Corey Haines") mailing list, and [Ruby Rogues](http://rubyrogues.com/)
Parley list). Both of these lists are private so I thought it would be
worthwhile posting my answer here.

Both of the questions were concerned with out-side-in development, full-stack
integration testing, and how much of the application needs to be tested through
the entire system.

Firstly consider why we write [cucumber](http://cukes.info/) scenarios (or
[fitnesse](http://fitnesse.org/) test cases). These tests are business facing
acceptance tests. They are a medium through which we can engage with the
business people on our team and to help us understand how the system should
behave. They give us an opportunity to check _our_ understanding of what the
system should do &mdash; to check the _business_'s understanding of what the
system should do. We automate these tests to give the business confidence that
the system behaves as expected.

Full-stack, end-to-end, integration tests are there to give us confidence that
the system fits together correctly, that we have all the different pieces in
place, and they are able to talk to each other.

It's very easy to conflate these two concerns. I have worked on many systems
where the business facing acceptance tests were also the end-to-end integration
tests. The test runs end up being slow, and the tests are cumbersome to work
with.

I've been talking about this with [Matt Wynne](https://twitter.com/mattwynne)
and he drew the following diagram:

![Business Facing Acceptance Tests vs End-To-End
Tests](/images/business-facing-vs-end-to-end.png)

The circle on the left represents the tests that we would write in cucumber (or
fitnesse). The circle on the right the tests which exercise the whole system
end-to-end. In the centre we have the intersection &mdash; our cucumber
scenarios which we run end-to-end against the whole system.

The key thing is that your business acceptance tests do not all have to drive
the whole system end-to-end. We only a need a few scenarios to go end-to-end to
give us the confidence the system as a whole is working. We can also write
system tests, that aren't part of the acceptance suite, to test specific
integrations

Try to write acceptance tests that directly drive the domain objects. Use these
to accurately describe your application's behaviour. Focus them on the behaviour
by not having them integrate the UI and the database.
