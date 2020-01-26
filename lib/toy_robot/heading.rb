module ToyRobot
  class Heading
    private_class_method :new

    attr_reader :name, :forward_deltas

    def initialize(name, forward_deltas)
      @name = name
      @forward_deltas = forward_deltas
    end

    def rotate_left
      self.class.rotate_left_of(self)
    end

    def rotate_right
      self.class.rotate_right_of(self)
    end

    def to_s
      name
    end

    class << self
      def from(str)
        instances.find { |heading| heading.name == str.upcase }
      end

      def rotate_left_of(instance)
        heading_change(instance, -1)
      end

      def rotate_right_of(instance)
        heading_change(instance, 1)
      end

      private

      def heading_change(instance, delta)
        index = instances.index(instance)
        new_heading_index = index + delta
        new_heading_index = new_heading_index % 4 if new_heading_index >= 4
        instances[new_heading_index]
      end

      def instances
        @instances ||= [
          new('NORTH', [0,1]),
          new('EAST', [1,0]),
          new('SOUTH', [0,-1]),
          new('WEST', [-1,0])
        ]
      end
    end
  end
end
