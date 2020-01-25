module ToyRobot
  class Simulator
    def self.run
      puts 'Welcome to ToyRobot'

      table = Table.new(5, 5)
      robot = nil
      context = Context.new(table, robot)

      while input = STDIN.gets.chomp()
        command = CommandFactory.command_from(input)

        continue if context.robot.nil? && !command.is_a?(PlaceCommand)

        context = command.execute(context)
      end
    end

    def self.process_place_command(table, input)
      place_regex = /\APLACE (?<x>\d+),(?<y>\d+),(?<heading>NORTH|EAST|SOUTH|WEST)\z/
      if match = place_regex.match(input)
        x, y, heading = match.named_captures.fetch_values('x', 'y', 'heading')
        x = Integer(x)
        y = Integer(y)

        position = ToyRobot::Position.new(x, y, heading)
        ToyRobot::Robot.new(table, position)
      end
    end
  end
end
