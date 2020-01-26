module ToyRobot
  class PlaceCommand
    def initialize(x, y, heading)
      @x = x
      @y = y
      @heading = heading
    end

    def execute(context)
      position = Position.new(@x, @y, @heading)
      robot = Robot.new(context.table, position)
      context.duplicate(robot: robot)
    end
  end
end
