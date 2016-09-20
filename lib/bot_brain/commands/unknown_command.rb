module BotBrain
  module Commands
    class UnknownCommand < Command
      def initialize
        super('')
      end

    private

      def process(message)
        "Unknown command: #{message.text}"
      end

      def description
      end

      def example
      end
    end
  end
end
