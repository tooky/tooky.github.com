---
layout: post
title: Delegation is not inheritance
categories:
  - oo
  - ruby
date: 2012-08-08 13:16:00 +00:00
---
<p class="date">08 August 2012</p>

On the train home last night I watched the excellent [Jim Weirich
Play-by-play](https://peepcode.com/products/play-by-play-jimweirich-ruby) from
[PeepCode](https://peepcode.com/).

During the screencast Jim develops a library that "protects against unauthorized
data model modification by users in less-privileged roles." The screencast
provides a great insight into the way Jim approaches problems, designs apis, and
how he's customised his environment to suit the way he works.

His approach is to build a proxy object which wraps the object to be updated,
and provides a whitelist for fields which can be updated. He also inadvertantly
demonstrates an easy mistake to make when using proxy objects.

Here is a simplified version of Jim's solution -  without any of the api for
creating / finding proxies - which we will use to demonstrate this pitfall and
its effects.

<script src="https://gist.github.com/3294185.js?file=protection_proxy.rb">
</script>

This approach works great for silently dropping calls to the accessor methods
that are not in the provided whitelist. Here are some rspec examples which show
how it works.

<script src="https://gist.github.com/3294185.js?file=protection_proxy_spec.rb">
</script>

Now if we imagine we have a rails project, we can create a proxy to wrap our
ActiveRecord object, and specify an attribute whitelist.  This should then
prevent mass-assignment of any non-whitelist attributes - it could be used in
a controller like this:

<script src="https://gist.github.com/3294185.js?file=user_controller.rb">
</script>

Unfortunately this won't work as we might expect.

Proxying like this is a great way to add new behaviour to existing objects,
without modifying them - or creating new subclasses. but there is one thing to
be aware of when you are using delegation in this way.

Methods called on the wrapped object have **no** knowledge of the methods in the
proxy object.

So what happens when we call `proxy.update_attributes`?

The proxy object immediately delegates that method call to the user object, it
will call `user.update_attributes`.

If you have used ActiveRecord, you will be aware of the way that
`ActiveRecord::Base#update_attrbiutes` will make use of the accessor methods on
its instances to set the field names.

So, `user.update_attributes name: 'Joe'` will call `user.name = 'Joe'`, not the
accessor methods on the proxy.

![update attributes sequence
diagram](http://dl.dropbox.com/u/41915/update_attributes_sequence_diagram.png)

As we are not calling the accessor methods on the proxy, we aren't filtering out
the fields that don't appear in the whitelist and our attribute protection won't
work when we use `update_attributes`.

Here is another example. `Capitalise` wraps an object and provides a upper case
version of its name method.

<script src="https://gist.github.com/3294185.js?file=wrapper_example.rb">
</script>

Because `greet` is defined in the `Person` class, when it calls `name` it will
always call `Person#name`.

This has caught me out a couple times. It's so easy in ruby to create proxy
objects or decorators that its easy to forget that you have a different object.

One solution is to implement a version of `update_attributes` on the proxy
object.

<script src="https://gist.github.com/3294185.js?file=protection_proxy_update_attributes.rb">
</script>

Here we add an `update_attributes` method to the `ProtectionProxy` class - this
only allows attributes allowed by the whitelist through to
`User#update_attributes`.

The [screencast](https://peepcode.com/products/play-by-play-jimweirich-ruby)
ends with a note that Jim noticed this error later after recording of the screen
cast finished. Jim's complete solution, including the nice api, can be found on
[github](https://github.com/jimweirich/protection_proxy).

Here is the whole of the `ProxyProtection` implementation, with rspec examples.

<script src="https://gist.github.com/3294185.js?file=protection_proxy_full_spec.rb">
</script>

