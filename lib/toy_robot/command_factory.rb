module ToyRobot
  class CommandFactory
    class << self
      def command_from(input)
        case input
        when /\APLACE (?<x>\d+),(?<y>\d+),(?<heading>NORTH|EAST|SOUTH|WEST)\z/ then create_place_command($~)
        when /\AMOVE\z/ then MoveCommand.new
        when /\ALEFT\z/ then LeftCommand.new
        when /\ARIGHT\z/ then RightCommand.new
        when /\AREPORT\z/ then ReportCommand.new
        else UnknownCommand.new
        end
      end

      private

      def create_place_command(matches)
        args = matches.named_captures
        x = Integer(args['x'])
        y = Integer(args['y'])
        heading = Heading.heading_from(args['heading'])

        PlaceCommand.new(x, y, heading)
      end
    end
  end
end
