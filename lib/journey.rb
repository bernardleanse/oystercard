class Journey
  MIN_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station
  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(station_name)
    @entry_station = station_name
  end

  def end(station_name)
    @exit_station = station_name
  end

  def on_journey?
    @entry_station && exit_station.nil? # check this logic
  end
  
  def fare
    charge = Charge.new(@entry_station, @exit_station)
    charge.amount
  end

end