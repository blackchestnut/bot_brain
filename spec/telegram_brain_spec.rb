require 'spec_helper'

describe TelegramBrain do
  it 'has a version number' do
    expect(TelegramBrain::VERSION).not_to be nil
  end

  class StartCommand < TelegramBrain::Bot::Commands::Command
    def initialize
      super('/start')
    end
  end

  describe '#answer' do
    subject { brain.answer(raw_message) }
    let(:brain) { TelegramBrain::Brain.new(token, dictionary) }
    let(:token) { 'fake_token' }
    let(:command) { StartCommand.new }
    let(:dictionary) { TelegramBrain::Bot::Dictionary.new([command], nil) }
    let(:raw_message) do
      {
        'text' => '/start',
        'chat' => { 'id' => 123 },
        'from' => { 'first_name' => 'Alex', 'last_name' => 'Black' }
      }
    end
    let(:fake_api) { double(call: nil) }
    before { allow(::Telegram::Bot::Api).to receive(:new).and_return(fake_api) }
    before { allow(command).to receive(:answer).and_return('fake_answer') }
    before { subject }

    it do
      expect(fake_api).
        to have_received(:call).
        with('sendMessage', { chat_id: 123, text: 'fake_answer' })
    end
  end
end
