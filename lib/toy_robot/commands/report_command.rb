module ToyRobot
  class ReportCommand
    def execute(context)
      context.robot&.report()
      context
    end
  end
end
