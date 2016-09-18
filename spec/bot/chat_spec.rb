require 'spec_helper'

describe TelegramBrain::Bot::Chat do
  let(:chat) { TelegramBrain::Bot::Chat.new(chat_id) }
  let(:chat_id) { 123 }

  describe '#id' do
    subject { chat.id }
    it { is_expected.to eq chat_id }
  end
end
