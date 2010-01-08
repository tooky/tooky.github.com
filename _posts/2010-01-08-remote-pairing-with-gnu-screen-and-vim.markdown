--- 
layout: post
title: Remote pairing with GNU Screen and Vim
categories: 
  - practices
  - eden
date: 2010-01-08 22:39:00 +00:00
--- 
<p class="date">8th January 2010</p>

All the recent [#uksnow](http://search.twitter.com/search?q=%23uksnow) has left the [Eden studio](http://edendevelopment.co.uk/blogs/company/2009/11/28/welcome-to-our-new-office/) a little deserted. With several of us having longish drives in to the office, we've been forced to get much better at remote pairing.

In the past we've used iChat screen sharing in the office for pairing on laptops, but with two people both at the end of a DSL connection, the screen + voice bandwidth demands are pretty high, and the guest user is at a painful disadvantage.

[Vim](http://www.vim.org/) is currently undergoing something of a rennaisance at [Eden Development](http://edendevelopment.co.uk). Several of us have been trying to use it for all our coding. Fortunately this has stood us in good stead to take advantage of a great low bandwidth pair programming solution.

[GNU Screen](http://www.gnu.org/software/screen/) + [vim](http://www.vim.org/) (+ [skype](http://skype.com)).

John Haruska gives a great [overview of different remote pairing solution](http://haruska.com/2009/09/29/remote-pair-programming/) and outlines how to use screen to set up a shared terminal. Unfortunately we weren't able to use the acl method to allow different UNIX users to share a 'screen' on our macs, but if both users logged in to the same unix account it worked like a dream.

Our basic process is:

User 1 sets up a screen as a shared user on the host machine

    pairing$ screen -S pairing
    Ctrl-a :multiuser on

User 2, logs into the maching via ssh, and connects to the shared screen

    local$ ssh pairing@shared_machine
    pairing$ screen -x pairing

That's basically it. Both users then have access to a full shared terminal environment. A shared screen can have multiple windows, so we tend to work with one screen for vim and another for running tests and other terminal commands. We also make extensive use of [vim tabs](http://www.linux.com/archive/articles/59533) and shell execution from within vim.

A couple of tips:

- make use of the [GNU screen scrollback buffer](http://www.samsarin.com/blog/2007/03/11/gnu-screen-working-with-the-scrollback-buffer/)
- remote pairing can be quite intense, we find using [The Pomodoro Technique](http://www.pomodorotechnique.com/) really useful in helping combat that - see [http://tomatoi.st/](http://tomatoi.st/) for a shared timer.
- audio is essential, but having a video link is even better
- SSH requires some kind of NAT/firewall traversal - we found it simplest to just connect to the office vpn.

[aimee](http://edendevelopment.co.uk/blogs/aimee/) has a great description of how aimee, [Enrique](http://blog.nexwerk.com/) and I ended up [trio-programming](http://edendevelopment.co.uk/blogs/aimee/2010/01/06/remote-trio-programming/) over the last couple of days, and here's a photo to prove it. I'm the remote on the macbook to aimee's left.

![trio-programming](http://farm5.static.flickr.com/4055/4257007886_3442ceceba_d.jpg "Trio-programming with aimee and Enrique")
