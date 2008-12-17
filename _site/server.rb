#!/usr/bin/env ruby
require 'webrick'
include WEBrick

s = HTTPServer.new(
                   :Port => 2000,
                   :DocumentRoot => Dir::pwd + "/_site"
                   )

trap("INT"){ s.shutdown }
s.start
