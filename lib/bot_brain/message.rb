module BotBrain
  class Message
    def initialize(data)
      @data = data || {}
    end

    def chat_id
      @data['chat'] && @data['chat']['id']
    end

    def text
      @data['text']
    end

    def user_full_name
      "#{@data['from']['first_name']} #{@data['from']['last_name']}"
    end

    def to_s
      @data.to_s
    end
  end
end
