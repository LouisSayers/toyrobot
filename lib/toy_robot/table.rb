module ToyRobot
  class Table
    attr_reader :width, :height

    def initialize(width, height)
      @width = width
      @height = height
    end

    def point_valid?(point)
      x_within_bounds = (point.x >= 0 && point.x < width)
      y_within_bounds = (point.y >= 0 && point.y < height)

      x_within_bounds && y_within_bounds
    end
  end
end
