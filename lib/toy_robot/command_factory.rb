module ToyRobot
  class CommandFactory
    class << self
      def command_from(input)
        case input
        when /\APLACE (?<x>\d+),(?<y>\d+),(?<heading>NORTH|EAST|SOUTH|WEST)\z/

        when /\AMOVE\z/ then MoveCommand.new
        when /\ALEFT\z/ then LeftCommand.new
        when /\ARIGHT\z/ then RightCommand.new
        when /\AREPORT\z/ then ReportCommand.new
        else UnknownCommand.new
        end
      end
    end
  end
end
