require './lib/card'

describe Oystercard do

  it 'responds to balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'has a default balance of 0' do
    expect(subject.balance).to eq 0
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }
  it 'inceases the balance on the card' do
    expect { subject.top_up(10) }.to change { subject.balance }.from(0).to(10)
  end

end