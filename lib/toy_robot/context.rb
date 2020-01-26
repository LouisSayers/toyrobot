module ToyRobot
  class Context
    attr_reader :table, :robot

    def initialize(table, robot)
      @table = table
      @robot = robot
    end

    def duplicate(changes = {})
      new_table = changes[:table] || table
      new_robot = changes[:robot] || robot
      self.class.new(new_table, new_robot)
    end
  end
end
