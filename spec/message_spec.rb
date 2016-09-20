require 'spec_helper'

describe BotBrain::Message do
  let(:message) { BotBrain::Message.new(data) }
  let(:data) { {} }

  describe '#chat_id' do
    subject { message.chat_id }

    context 'without data' do
      it { is_expected.to be_nil }
    end

    context 'with data' do
      let(:data) { { 'chat' => { 'id' => 123 } } }
      it { is_expected.to eq 123 }
    end
  end

  describe '#text' do
    subject { message.text }

    context 'with text' do
      let(:data) { { 'text' => 'foo bar baz' } }
      it { is_expected.to eq data['text'] }
    end

    context 'without text' do
      let(:data) {}
      it { is_expected.to be_nil }
    end
  end

  describe '#user_full_name' do
    subject { message.user_full_name }
    let(:data) do
      { 'from' => { 'first_name' => 'Alex', 'last_name' => 'Black' } }
    end

    it { is_expected.to eq 'Alex Black' }
  end
end
