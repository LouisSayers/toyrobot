module ToyRobot
  class Robot
    attr_reader :position

    def initialize(position)
      @position = position
    end

    def turn_left
      @position = position.rotate_left
    end

    def turn_right
      @position = position.rotate_right
    end

    def report
      Logger.log(@position.to_s)
    end
  end
end
