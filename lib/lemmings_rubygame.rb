require 'bundler'
Bundler.require
require 'pry'

require 'rubygame'
include Rubygame
include Rubygame::Events

Rubygame::Surface.autoload_dirs << File.expand_path("../../resources/sprites", __FILE__)

require_relative './lemmings_rubygame/lemming.rb'

module LemmingsRubygame
  class Game
    def initialize
      @screen = Rubygame::Screen.new [640,480], 0, [Rubygame::HWSURFACE, Rubygame::DOUBLEBUF]
      @screen.title = "Lemmings"

      @queue = Rubygame::EventQueue.new
      @clock = Rubygame::Clock.new
      @clock.target_framerate = 30

      # Create The Background
      @background = Surface.new(@screen.size)
      @background.fill([0,0,0])

      TTF.setup
      font_filename = File.join(File.dirname(__FILE__), '..', 'resources', 'fonts', 'AgentOrange.ttf')
      @agent_orange_font = TTF.new font_filename, 12

      @lemming = Lemming.new
    end

    def run
      loop do
        update
        draw
        @clock.tick
      end
    end

    def update
      @lemming.update(@clock.tick/1000.0)
      @queue.each do |ev|
        case ev
          when Rubygame::QuitEvent
            Rubygame.quit
            exit
        end
      end
    end

    def draw
      @background.blit(@screen, [0, 0])
      draw_version
      @lemming.draw(@screen)

      @screen.flip
    end

    private
    def draw_version
      test = @agent_orange_font.render "Lemmings Version #{Lemmings::VERSION}", true, [123,123,123]
      test.blit @screen, [@screen.w-test.w-6, 6]
    end
  end
end

game = LemmingsRubygame::Game.new
game.run
