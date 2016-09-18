require 'spec_helper'

describe TelegramBrain::Bot::Dictionary do
  describe '#get_command' do
    subject { dictionary.get_command(message) }
    let(:dictionary) { TelegramBrain::Bot::Dictionary.new(commands) }
    let(:message) { TelegramBrain::Bot::Message.new(data) }
    let(:data) do
      { 'text' => '/help' }
    end

    context 'without commands' do
      let(:commands) { [] }

      it { is_expected.not_to be_nil }
      it do
        is_expected.to be_a TelegramBrain::Bot::Commands::UnknownCommand
      end
    end

    context 'with commands' do
      let(:commands) { [command_1, command_2] }
      let(:command_1) { TelegramBrain::Bot::Commands::Command.new('/start') }
      let(:command_2) { TelegramBrain::Bot::Commands::Command.new('/help') }

      it { is_expected.to be command_2 }
    end
  end
end
