module ToyRobot
  class MoveCommand
    def execute(context)
      context.robot&.move()
      context
    end
  end
end
