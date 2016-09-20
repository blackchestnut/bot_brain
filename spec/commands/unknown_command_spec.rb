require 'spec_helper'

describe BotBrain::Commands::UnknownCommand do
  let(:command) { BotBrain::Commands::UnknownCommand.new }

  describe '#answer' do
    subject { command.answer(message) }
    let(:message) { BotBrain::Message.new(data) }
    let(:data) { { 'text' => '/foo' } }

    it { is_expected.to eq 'Unknown command: /foo' }
  end
end
