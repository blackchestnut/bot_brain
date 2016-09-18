module TelegramBrain
  module Bot
    module Commands
      class Command
        attr_reader :name

        def initialize(name)
          @name = name
          @alias = name
        end

        def can_answer?(message)
          data = name_regexp.match(message.text)
          !!data && data.length > 0
        end

        def answer(message)
          @args = parse_args(message.text)
          return help_full if @args == '?'

          process(message)
        end

        def help
          "#{name} - #{description}\n"
        end

      private

        def process(message)
          message.text
        end

        def description
          'No description, this is abstract command'
        end

        def example
          'No example, this is abstract command'
        end

        def help_full
          "#{help}\nExample:\n#{example}"
        end

        def parse_args(text)
          return if text.nil?
          text.sub(name_regexp, '').strip
        end

        def name_regexp
          @name_regexp ||= Regexp.new("\\A#{name}")
        end
      end
    end
  end
end
