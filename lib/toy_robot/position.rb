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

    def move_forward
      x_change, y_change = {
        NORTH => [0, 1],
        EAST => [1, 0],
        SOUTH => [0, -1],
        WEST => [-1, 0],
      }[heading]

      self.class.new(x + x_change, y + y_change, heading)
    end

    def to_s
      [x, y, heading_name].join(',')
    end

    private

    def heading_name
      %w(NORTH EAST SOUTH WEST)[heading]
    end

    def heading_change(delta)
      index = heading + delta
      index = index % 4 if index >= 4
      [NORTH, EAST, SOUTH, WEST][index]
    end
  end
end
