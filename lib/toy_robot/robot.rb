module ToyRobot
  class Robot
    attr_reader :position

    def initialize(table, position)
      @table = table
      @position = position
    end

    def turn_left
      @position = position.rotate_left
    end

    def turn_right
      @position = position.rotate_right
    end

    def move
      new_position = position.move_forward
      if @table.point_valid?(new_position)
        @position = new_position
      end
    end

    def report
      Logger.log(@position.to_s)
    end
  end
end
