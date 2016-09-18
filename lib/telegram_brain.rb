require 'telegram/bot'

require 'telegram_brain/version'
require 'telegram_brain/bot/chat'
require 'telegram_brain/bot/dictionary'
require 'telegram_brain/bot/message'
require 'telegram_brain/bot/commands/command'
require 'telegram_brain/bot/commands/unknown_command'

module TelegramBrain
  class Brain
    def initialize(token, dictionary)
      @token = token
      @dictionary = dictionary
      @chats = {}
    end

    def answer(raw_message)
      message = TelegramBrain::Bot::Message.new(raw_message)
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
      @chats[chat_id] || @chats[chat_id] = Bot::Chat.new(chat_id)
    end

    def api
      @api ||= ::Telegram::Bot::Api.new(@token)
    end
  end
end
