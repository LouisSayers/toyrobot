module ToyRobot
  class Position
    attr_reader :x, :y, :heading

    def initialize(x, y, heading)
      @x = x
      @y = y
      @heading = heading
    end

    def rotate_left
      self.class.new(x, y, heading.rotate_left)
    end

    def rotate_right
      self.class.new(x, y, heading.rotate_right)
    end

    def move_forward
      x_change, y_change = heading.forward_deltas
      self.class.new(x + x_change, y + y_change, heading)
    end

    def to_s
      [x, y, heading].join(',')
    end
  end
end
