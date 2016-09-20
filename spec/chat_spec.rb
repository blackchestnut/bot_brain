require 'spec_helper'

describe BotBrain::Chat do
  let(:chat) { BotBrain::Chat.new(chat_id) }
  let(:chat_id) { 123 }

  describe '#id' do
    subject { chat.id }
    it { is_expected.to eq chat_id }
  end
end
