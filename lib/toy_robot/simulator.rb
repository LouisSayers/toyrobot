module ToyRobot
  class Simulator
    def self.run
      Logger.log('Welcome to ToyRobot')

      table = Table.new(5, 5)
      robot = nil
      context = Context.new(table, robot)

      while input = STDIN.gets&.chomp()
        command = CommandFactory.command_from(input)

        if context.robot.nil? && !command.is_a?(PlaceCommand)
          Logger.error('You must place the robot first')
          next
        end

        context = command.execute(context)
      end
    end
  end
end
