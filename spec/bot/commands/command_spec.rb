require 'spec_helper'

describe TelegramBrain::Bot::Commands::Command do
  let(:command) { TelegramBrain::Bot::Commands::Command.new('/start') }
  let(:message) { TelegramBrain::Bot::Message.new(data) }
  let(:data) { { 'text' => text } }

  describe '#can_answer?' do
    subject { command.can_answer?(message) }

    context 'true' do
      let(:text) { '/start foo' }
      it { is_expected.to eq true }
    end

    context 'false' do
      let(:text) { '/stop' }
      it { is_expected.to eq false }
    end
  end

  describe '#answer' do
    context 'without ?' do
      subject { command.answer(message) }
      let(:text) { '/start' }

      it { is_expected.to eq '/start' }
    end

    context 'with ?' do
      subject { command.answer(message) }
      let(:text) { '/start ?' }

      before { allow(command).to receive(:description).and_return('foo') }
      before { allow(command).to receive(:example).and_return('/start') }

      it { is_expected.to eq "/start - foo\n\nExample:\n/start" }
    end

    context 'without text' do
      subject { command.answer(message) }
      let(:text) {}

      it { is_expected.to be_nil }
    end
  end
end
