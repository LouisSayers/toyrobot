module ToyRobot
  class UnknownCommand
    def execute(context)
      Logger.error('Unknown command')
      context
    end
  end
end
