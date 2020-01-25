module ToyRobot
  class Heading
    class << self
      def heading_from(str)
        %w(NORTH EAST SOUTH WEST).index(str.upcase)
      end
    end
  end
end
