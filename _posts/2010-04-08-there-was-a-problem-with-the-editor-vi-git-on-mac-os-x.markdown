--- 
layout: post
title: Fixing "There was a problem with the editor 'vi'" for Git on Mac OS X Snow Leopard
categories: 
  - git
  - macosx
  - vim
  - eden
date: 2010-04-08 22:31:00 +00:00
--- 
<p class="date">8th April 2010</p>

I have had an annoying problem with git and vi. I like to use vim to edit my
commit messages, but I've been hit with this annoying message every time I
write the message and quit vim.

    error: There was a problem with the editor 'vi'

After a little bit of digging I found that this message is shown by git when
the editor exits with a non-zero exit code. You can use <code>$?</code> to see
the exit code of last script or application.

    $ vim     # then exit vim with :q immediately
    $ echo $?
    1

I'm still not sure why vim is exiting with non-zero exit code, but it is
definitely related to my <code>.vimrc</code> - moving it to 
<code>.vimrc.bak</code> seemed to fix the problem. I'm using the excellent 
[pathogen](http://www.vim.org/scripts/script.php?script_id=2332) plugin to
manage my vimfiles, so I plan to go through that and my installed plugins to 
find the cause of the problem.

There is a fix though, I'm not sure what's causing this, but I found a [post on
the vim-mac mailing list](http://groups.google.com/group/vim_mac/browse_thread/thread/0d33e2f2130867b0)
which shows this:

    $ vim          # and exit with :q
    $ echo $?
    1
    $ /usr/bin/vim # and exit with :q
    $ echo $?
    0
    $ which vim
    /usr/bin/vim

Running vim with <code>/usr/bin/vim</code> seems to make it exit cleanly. So to
fix the problem with git commit you just need to run this:

    $ git config --global core.editor /usr/bin/vim

I'd still like to get to the root of the problem, but this gets me my git commit
messages back!
