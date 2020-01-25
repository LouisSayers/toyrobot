module ToyRobot
  class Context
    attr_reader :table, :robot

    def initialize(table, robot)
      @table = table
      @robot = robot
    end
  end
end
