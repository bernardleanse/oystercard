require './lib/card'

describe Oystercard do

  it 'responds to balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'has a default balance of 0' do
    expect(subject.balance).to eq 0
  end

end