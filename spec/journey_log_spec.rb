# describe 'list_of_journeys' do
#   let(:station1) { double :station }
#   let(:station2) { double :station }
#   let(:journey) { double(:journey, start: station1, end: station2, entry_station: station1, exit_station: station2, fare: MIN_FARE) }
#   let(:j_class) { double(:journey, new: journey)}
#   let(:card) { Oystercard.new(j_class) }

#   it 'is initialised with an empty array of journeys' do
#     expect(card.list_of_journeys.empty?).to eq true
#   end

#   it 'stores a single journey when one journey is made' do
#     card.top_up(MIN_FARE)
#     card.touch_in(station1)
#     card.touch_out(station2)
#     expect(card.list_of_journeys.count).to eq 1
#   end
# end