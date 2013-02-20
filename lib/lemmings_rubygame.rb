require 'bundler'
Bundler.require

require 'rubygame'
include Rubygame
include Rubygame::Events

class LemmingsRubygame
	def initialize
		@screen = Rubygame::Screen.new [640,480], 0, [Rubygame::HWSURFACE, Rubygame::DOUBLEBUF]
		@screen.title = "Lemmings"

		@queue = Rubygame::EventQueue.new
		@clock = Rubygame::Clock.new
		@clock.target_framerate = 30
    TTF.setup
    filename = File.join(File.dirname(__FILE__), '..', 'resources', 'fonts', 'AgentOrange.ttf')
    @agent_orange_font = TTF.new filename, 12
	end

	def run
		loop do
			update
			draw
			@clock.tick
		end
	end

	def update
		@queue.each do |ev|
			case ev
				when Rubygame::QuitEvent
					Rubygame.quit
					exit
			end
		end
	end

	def draw
    test = @agent_orange_font.render "Lemmings Version #{Lemmings::VERSION}", true, [123,123,123]
    test.blit @screen, [@screen.w-test.w-6, 6]
		@screen.flip
	end
end

game = LemmingsRubygame.new
game.run
