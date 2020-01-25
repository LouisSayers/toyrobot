module ToyRobot
  class PlaceCommand
    def initialize(x, y, heading)
      @x = x
      @y = y
      @heding = heading
    end

    def execute(context)
      context
    end
  end
end
