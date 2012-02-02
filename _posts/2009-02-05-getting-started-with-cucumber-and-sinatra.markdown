---
layout: post
title: Getting started with Cucumber and Sinatra
categories:
  - cucumber
  - sinatra
  - bdd
permalink:  /2009/02/05/getting-started-with-cucumber-and-sinatra.html
---
<p class="date">5 February 2009</p>

**UPDATE** Sinatra and cucumber integration has changed now, Rob Holland updated the [wiki](https://github.com/cucumber/cucumber/wiki/sinatra) to reflect it. There is also a more full featured example on his [branch](http://github.com/robholland/cucumber/commit/0e12d8100ca8541af014abe6a480c53a90b6aebd) of cucumber. I've updated the blog to reflect that.

[Sinatra](http://sinatra.github.com) is probably the most popular ruby micro web framework at the moment. Its simple dsl for quickly creating web apps, it give you "just enough" framework to get things done.

[Cucumber](http://cukes.info) is that latest development from the [BDD](http://dannorth.net/introducing-bdd) / [RSpec](http://rspec.info) guys. [Cucumber](http://cukes.info) lets you describe the behaviour of your software in plain text. These files then serve as automated tests and documentation.

I've been considering using both of these tools for an upcoming project so I wanted to make sure they worked happily together. A quick google seemed to suggest that some work had been done, but I could find a tutorial for getting up and running. Happily the latest releases of Cucumber (and [Webrat](http://github.com/brynary/webrat/tree/master)) have Sinatra support built in so its really very easy!

With cucumber you write your plain text specifications in terms of 'features', by convention they are in a features directory with the .feature extension. So for our purposes we will start with a very simple feature:

<div class="file">
  <div class="name">features/home.feature</div>
  <div class="text">
{% highlight text %}
Feature: view pages

  Scenario: Home page
    Given I am viewing "/"
    Then I should see "Hello, world!
{% endhighlight %}
  </div>
</div>

To run our feature (and test our code against it) is as simple as <code>cucumber feature/home.feature</code>.

![cucumber pending steps](/images/cucumber1.png)

Cucumber parses the feature and looks for matching step definitions. As we can see in the screenshot we need to implement the steps in our feature so cucumber knows how to run it. Step definitions are implemented in ruby.

 <div class="file">
  <div class="name">features/step_definitions/hello_sinatra_steps.rb</div>
  <div class="text">
{% highlight ruby %}
Given /^I am viewing "(.+)"$/ do |url|
  visit(url)
end
 
Then /^I should see "(.+)"$/ do |text|
  response_body.should =~ Regexp.new(Regexp.escape(text))
end
{% endhighlight %}
  </div>
</div>

These two simple steps make use of webrat to request the url from our app and check that the response contains the text we're looking for.

![cucumber failing without webrat](/images/cucumber2.png)

The feature is currently failing as a method we have used in our step definition doesn't exist. <code>visit</code> is a method from webrat so we need to configure cucumber's environment to use webrat. Webrat has a <code>SinatraSession</code> specifically for testing sinatra web apps. We will also need to require the RSpec expectations as we are using them to check the response.

<div class="file">
  <div class="name">features/support/env.rb</div>
  <div class="text">
{% highlight ruby %}
require 'spec/expectations'
require 'webrat'
Webrat.configure do |config|
  config.mode = :sinatra
end

World do
  Webrat::SinatraSession.new
end
{% endhighlight %}
  </div>
</div>

Running the scenario again, and we see that everything is hooked up properly and the scenario is failing (as expected because we haven't written any code).

![cucumber failing no code](/images/cucumber3.png)

Now we have our failing scenario we can start putting together our web app and make sure we're running with a green light!

<div class="file">
  <div class="name">hello.rb</div>
  <div class="text">
{% highlight ruby %}
require 'sinatra'
 
get '/' do
  "Hello, world!"
end
{% endhighlight %}
  </div>
</div>

Now if we run out scenario again unfortunately it still fails, we need to hook cucumber up to our app.

<div class="file">
  <div class="name">features/support/env.rb</div>
  <div class="text">
{% highlight ruby %}
require 'spec/expectations'
require 'webrat'
Webrat.configure do |config|
  config.mode = :sinatra
end

World do
  Webrat::SinatraSession.new
end

require File.dirname(__FILE__) + '/../../hello''
{% endhighlight %}
  </div>
</div>

Finally running cucumber gives us that nice green feeling.

![green cucumber](/images/cucumber4.png)

The only thing left to do is to add a rake file to run our features for us.

<div class="file">
  <div class="name">Rakefile</div>
  <div class="text">
{% highlight ruby %}
require 'rubygems'
require 'cucumber/rake/task'
 
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty"
end
{% endhighlight %}
  </div>
</div>

![rake features](/images/cucumber5.png)

All of the code for this getting started guide is available from [gist](http://gist.github.com/58647).

{% include permalink.html %}
