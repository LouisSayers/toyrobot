module ToyRobot
  class Position
    NORTH = 0
    EAST = 1
    SOUTH = 2
    WEST = 3

    attr_reader :x, :y, :heading

    def initialize(x, y, heading)
      @x = x
      @y = y
      @heading = heading
    end

    def rotate_left
      self.class.new(x, y, heading_change(-1))
    end

    def rotate_right
      self.class.new(x, y, heading_change(1))
    end

    private

    def heading_change(delta)
      index = heading + delta
      index = index % 4 if index >= 4
      [ NORTH, EAST, SOUTH, WEST ][index]
    end
  end
end
