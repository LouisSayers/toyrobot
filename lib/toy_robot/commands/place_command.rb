module ToyRobot
  class PlaceCommand
    def initialize(x, y, heading)
      @x = x
      @y = y
      @heading = heading
    end

    def execute(context)
      position = Position.new(@x, @y, @heading)

      if context.table.point_valid?(position)
        robot = Robot.new(context.table, position)
        context.duplicate(robot: robot)
      else
        Logger.log('Invalid Position: Could not place Robot')
        context
      end
    end
  end
end
