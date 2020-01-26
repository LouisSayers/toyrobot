module ToyRobot
  class Logger
    class << self
      def log(msg)
        puts msg
      end

      def error(msg)
        log("Error: #{msg}")
      end
    end
  end
end
