# frozen_string_literal: true

require './lib/card'

MAX_BALANCE = Oystercard::MAX_BALANCE
MIN_FARE = Oystercard::MIN_FARE

describe Oystercard do
  describe '#balance' do
    it 'responds to balance' do
      expect(subject).to respond_to(:balance)
    end

    it 'has a default balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it 'inceases the balance on the card' do
      expect { subject.top_up(10) }.to change { subject.balance }.from(0).to(10)
    end

    it 'responds to top_up' do
      expect(subject).to respond_to(:top_up)
    end

    it 'rejects top ups that exceed the max balance' do
      expect { subject.top_up(91) }.to raise_error("This exceeds max balance of #{MAX_BALANCE}")
    end
  end

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in) }
    it 'return true when touching in' do
      subject.top_up(MIN_FARE)
      expect(subject.touch_in).to eq true
    end
    it 'raises an error if you try touching in whilst on a journey' do
      subject.top_up(MIN_FARE)
      subject.touch_in
      expect { subject.touch_in }.to raise_error('Cannot touch in, already on journey')
    end
    it 'raises an error if you try touching in with less than min balance' do
      expect { subject.touch_in }.to raise_error('Cannot touch in, balance is below min balance')
    end
  end

  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out) }
    it 'return false when touching out' do
      subject.top_up(MIN_FARE)
      subject.touch_in
      expect(subject.touch_out).to eq false
    end
    it 'raises an error if you try touching out whilst not on a journey' do
      expect { subject.touch_out }.to raise_error('Cannot touch out, not on a journey')
    end
    it 'deducts min_fare when you touch_out' do
      subject.top_up(MIN_FARE)
      subject.touch_in
      expect { subject.touch_out }.to change { subject.balance }.by(- MIN_FARE)
    end
  end
end
