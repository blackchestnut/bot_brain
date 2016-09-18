module TelegramBrain
  module Bot
    class Dictionary
      def initialize(commands, unknown_command = nil)
        @commands = commands
        @unknown_command = unknown_command ||
          TelegramBrain::Bot::Commands::UnknownCommand.new
      end

      def get_command(message)
        command = @commands.detect { |c| c.can_answer?(message) }
        command || @unknown_command
      end
    end
  end
end
