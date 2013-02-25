module LemmingsRubygame
  class Lemming
    include Rubygame::Sprites::Sprite

    # Initialize it with the lemming from a simulation
    def initialize(lemming)
      super()

      # @image and @rect are expected by the Rubygame sprite code
      @image = Surface["lemming.png"]
      @rect  = @image.make_rect

      @lemming = lemming
    end

    def update
      # We don't really want to be doing this.  We want the lemmings
      # to each have their own clock, operate on their own, and have this
      # sprite subscribe to notifications they send out when they change
      #@lemming.tick
      @rect.topleft = [@lemming.x, @lemming.y]
    end

    def draw on_surface
      @image.blit on_surface, @rect
    end
  end
end
