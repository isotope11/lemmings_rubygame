require_relative './lemming.rb'

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
      font_filename = File.expand_path('../../../resources/fonts/AgentOrange.ttf', __FILE__)
      @agent_orange_font = TTF.new font_filename, 12

      @lemmings = [] # Lemmings get added to this array
      @lemmings << Lemming.new
    end

    def run
      loop do
        @tick = @clock.tick
        update
        draw
      end
    end

    private
    def draw_version
      test = @agent_orange_font.render "Lemmings Version #{Lemmings::VERSION}.  # Lemmings: #{@lemmings.count}.  FPS: #{@clock.framerate.to_i}", true, [123,123,123]
      test.blit @screen, [@screen.w-test.w-6, 6]
    end

    def seconds_passed_since_last_tick
      @tick / 1000.0
    end

    def seconds_passed
      @clock.lifetime / 1000.0
    end

    def update
      @lemmings.each{|l| l.update(seconds_passed_since_last_tick) }
      @queue.each do |ev|
        case ev
        when MouseDownEvent
          @lemmings << Lemming.new
        when Rubygame::QuitEvent
          Rubygame.quit
          exit
        end
      end
    end

    def draw
      @background.blit(@screen, [0, 0])
      draw_version
      @lemmings.each{|l| l.draw(@screen) }

      @screen.flip
    end
  end
end

