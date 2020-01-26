module ToyRobot
  class UnknownCommand
    def execute(context)
      Logger.log('Error: Unknown command')
      context
    end
  end
end
