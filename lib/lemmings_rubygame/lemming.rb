module LemmingsRubygame
  class Lemming
    include Rubygame::Sprites::Sprite

    def initialize
      super

      # @image and @rect are expected by the Rubygame sprite code
      @image = Surface["lemming.png"]
      @rect  = @image.make_rect

      @lemming = Lemmings::Lemming.new
    end

    # Animate this object.  "seconds_passed" contains the number of ( real-world)
    # seconds that have passed since the last time this object was updated and is
    # therefore useful for working out how far the object should move ( which
    # should be independent of the frame rate)
    def update seconds_passed
      @lemming.update(seconds_passed)
      @rect.topleft = @lemming.topleft
    end

    def draw on_surface
      @image.blit on_surface, @rect
    end
  end
end
