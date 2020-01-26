module ToyRobot
  class RightCommand
    def execute(context)
      context.robot&.turn_right()
      context
    end
  end
end
