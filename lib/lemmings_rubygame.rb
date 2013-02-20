require 'bundler'
Bundler.require
require 'pry'

require 'rubygame'
include Rubygame
include Rubygame::Events

Rubygame::Surface.autoload_dirs << File.expand_path("../../resources/sprites", __FILE__)

module LemmingsRubygame
end

require_relative './lemmings_rubygame/game.rb'
require_relative './lemmings_rubygame/lemming.rb'

game = LemmingsRubygame::Game.new
game.run
