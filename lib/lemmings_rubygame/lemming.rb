module LemmingsRubygame
  class Lemming
    include Rubygame::Sprites::Sprite

    def initialize
      super

      # @image and @rect are expected by the Rubygame sprite code
      @image = Surface["lemming.png"]
      @rect  = @image.make_rect

      @angle = 2*Math::PI * rand
    end

    # Animate this object.  "seconds_passed" contains the number of ( real-world)
    # seconds that have passed since the last time this object was updated and is
    # therefore useful for working out how far the object should move ( which
    # should be independent of the frame rate)
    def update seconds_passed
      # This example makes the objects orbit around the center of the screen.
      # The objects make one orbit every 4 seconds
      @angle = ( @angle + 2*Math::PI / 4 * seconds_passed) % ( 2*Math::PI)

      @rect.topleft = [ 320 + 100 * Math.sin(@angle),
                        240 - 100 * Math.cos(@angle)]
    end

    def draw on_surface
      @image.blit on_surface, @rect
    end

  end
end
