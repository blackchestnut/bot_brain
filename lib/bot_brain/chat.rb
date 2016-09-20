module BotBrain
  class Chat
    attr_reader :id, :messages

    def initialize(chat_id)
      @id = chat_id
      @messages = []
    end

    def add(message)
      @messages << message
    end
  end
end
