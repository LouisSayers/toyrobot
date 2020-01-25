module ToyRobot
  class Robot
    attr_reader :position

    def initialize(position)
      @position = position
    end

    def turn_left
      @position = position.rotate_left
    end
  end
end
