require 'journey'
MIN_FARE =  Journey::MIN_FARE
PENALTY_FARE =  Journey::PENALTY_FARE
describe Journey do
  describe "#start" do

    it "should have an entry station name after starting" do
      subject.start('station')
      expect(subject.entry_station).to eq 'station'
    end

  end

  describe "#end" do

    it "should have an exit station name after ending" do
      subject.end('station')
      expect(subject.exit_station).to eq 'station'
    end
    
  end

  describe "#on_journey?" do
    it "should return true if entered and not yet exited" do
      subject.start('station')
      expect(subject.on_journey?).to eq true
    end
  end

  describe "#fare" do
    it "should return normal fare if journey complete" do
      subject.start("station")
      subject.end("station1")
      expect(subject.fare).to eq MIN_FARE
    end

    it "should return penalty fare if journey incomplete" do
      subject.start("station")
      expect(subject.fare).to eq PENALTY_FARE

      
    end
  end
end