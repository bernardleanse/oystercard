require './lib/station'

describe Station do

  station = Station.new("Euston", "1")
  it 'has a name' do
    expect(station.name).to eq("Euston")
  end
  it 'has a zone' do
    expect(station.zone).to eq("1")
  end
end