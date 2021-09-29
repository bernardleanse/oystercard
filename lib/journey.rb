class Journey
  MIN_FARE = 1
  # PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

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
    MIN_FARE
  end

end