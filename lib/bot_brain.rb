require 'telegram/bot'

require 'bot_brain/version'
require 'bot_brain/chat'
require 'bot_brain/dictionary'
require 'bot_brain/message'
require 'bot_brain/commands/command'
require 'bot_brain/commands/unknown_command'

module BotBrain
  class Brain
    def initialize(token, dictionary)
      @token = token
      @dictionary = dictionary
      @chats = {}
    end

    def answer(raw_message)
      message = BotBrain::Message.new(raw_message)
      add_to_chat(message)
      command = @dictionary.get_command(message)
      text = command.answer(message)
      api.call('sendMessage', chat_id: message.chat_id, text: text)
    end

  private

    def add_to_chat(message)
      chat = find_or_create_chat(message.chat_id)
      chat.add(message)
    end

    def find_or_create_chat(chat_id)
      @chats[chat_id] || @chats[chat_id] = BotBrain::Chat.new(chat_id)
    end

    def api
      @api ||= ::Telegram::Bot::Api.new(@token)
    end
  end
end
