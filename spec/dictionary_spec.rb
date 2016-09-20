require 'spec_helper'

describe BotBrain::Dictionary do
  describe '#get_command' do
    subject { dictionary.get_command(message) }
    let(:dictionary) { BotBrain::Dictionary.new(commands) }
    let(:message) { BotBrain::Message.new(data) }
    let(:data) do
      { 'text' => '/help' }
    end

    context 'without commands' do
      let(:commands) { [] }

      it { is_expected.not_to be_nil }
      it do
        is_expected.to be_a BotBrain::Commands::UnknownCommand
      end
    end

    context 'with commands' do
      let(:commands) { [command_1, command_2] }
      let(:command_1) { BotBrain::Commands::Command.new('/start') }
      let(:command_2) { BotBrain::Commands::Command.new('/help') }

      it { is_expected.to be command_2 }
    end
  end
end
