# frozen_string_literal: true

require './lib/card'
require './lib/journey'

MAX_BALANCE = Oystercard::MAX_BALANCE
MIN_FARE = Journey::MIN_FARE

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
      expect { subject.top_up(MAX_BALANCE + 1) }.to raise_error("This exceeds max balance of #{MAX_BALANCE}")
    end
  end


  context "touching in and out" do

      let(:station1) { double :station }
      let(:station2) { double :station }
      let(:journey) { double(:journey, start: station1, end: station2, entry_station: station1, exit_station: station2, fare: MIN_FARE) }
      let(:j_class) { double(:journey, new: journey) } # journey.start = station1
      let(:card) { Oystercard.new(j_class) }

    describe '#touch_in' do

      
      it 'raises an error if you try touching in whilst on a journey' do

        card.top_up(MIN_FARE)
        card.touch_in(station1)
        card.top_up(MIN_FARE)
        expect { card.touch_in(station1) }.to raise_error('Cannot touch in, already on journey')
      end

      it 'raises an error if you try touching in with less than min balance' do
        expect { card.touch_in(station1) }.to raise_error('Cannot touch in, balance is below min balance')
      end

      it 'records the entry station name on touch in' do
        card.top_up(MIN_FARE)
        card.touch_in(station1)
        expect(card.current_journey.entry_station).to eq station1
      end

    end

    describe '#touch_out' do
      
      it 'raises an error if you try touching out whilst not on a journey' do
        expect { card.touch_out(station2) }.to raise_error('Cannot touch out, not on a journey')
      end
  
      
      it 'deducts min_fare when you touch_out' do
        card.top_up(MIN_FARE)
        card.touch_in(station1)
        card.touch_out(station2)
        expect { card.touch_out(station2) }.to change { card.balance }.by(- MIN_FARE)
      end

      it 'records the exit station name on touch out' do
        card.top_up(MIN_FARE)
        card.touch_in(station1)
        card.touch_out(station2)
        expect(card.current_journey.exit_station).to eq station2
      end

    
      
    end

  end


end
