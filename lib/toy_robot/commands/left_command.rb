module ToyRobot
  class LeftCommand
    def execute(context)
      context.robot&.turn_left()
      context
    end
  end
end
