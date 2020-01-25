module ToyRobot
  class Simulator
    def self.run
      puts 'Welcome to ToyRobot'

      table = ToyRobot::Table.new(5, 5)
      robot = nil

      while input = STDIN.gets.chomp()
        if robot.nil?
          robot = process_place_command(table, input)
        else
          process_command(input, robot)
        end
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
      else
        puts "no match"
        puts "'#{input}'"
      end
    end

    def self.process_command(input, robot)
      case input
        when /\AMOVE\z/ then robot.move
        when /\ALEFT\z/ then robot.turn_left
        when /\ARIGHT\z/ then robot.turn_right
        when /\AREPORT\z/ then robot.report
      end
    end
  end
end
