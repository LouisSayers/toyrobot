module ToyRobot
  class Simulator
    def self.run
      puts 'Welcome to ToyRobot'

      table = Table.new(5, 5)
      robot = nil
      context = Context.new(table, robot)

      while input = STDIN.gets&.chomp()
        command = CommandFactory.command_from(input)

        next if context.robot.nil? && !command.is_a?(PlaceCommand)

        context = command.execute(context)
      end
    end
  end
end
