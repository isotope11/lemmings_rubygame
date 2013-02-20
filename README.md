# Lemmings RubyGame

This is a project meant to use the lemmings gem to render a lemmings game using
rubygame

## Run it

    ruby lib/lemmings_rubygame.rb
    # NOTE: We should get some Thor action up in here

## Installation
Make sure you see [the rubygame project](https://github.com/rubygame/rubygame/wiki/Linux-Install-Guide) to see the rubygame installation docs

OS X

    vim /Users/adamgamble/.rvm/gems/ruby-head@lemmings_rubygame/gems/ruby-sdl-ffi-0.4/lib/ruby-sdl-ffi/sdl/mac.rb

modify line 161 to be

    callback :imp, [:id, :sel, :ivar], :id


## Learning about RubyGame
https://github.com/rubygame/rubygame/blob/next/doc/getting_started.rdoc
http://docs.rubygame.org/rdoc/current/
http://rubygame.org/wiki/Guides_and_tutorials
https://github.com/rubygame/rubygame/tree/next/samples

