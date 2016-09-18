require 'spec_helper'

describe TelegramBrain::Bot::Commands::UnknownCommand do
  let(:command) { TelegramBrain::Bot::Commands::UnknownCommand.new }

  describe '#answer' do
    subject { command.answer(message) }
    let(:message) { TelegramBrain::Bot::Message.new(data) }
    let(:data) { { 'text' => '/foo' } }

    it { is_expected.to eq 'Unknown command: /foo' }
  end
end
