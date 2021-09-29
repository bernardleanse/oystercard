class Journey
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = nil
  end
  
  def fare
    deduct(MIN_FARE) # ------> Journey
  end

  def end_journey(station_name) # ------> Journey
    @exit_station = station_name
    
    # @entry_station = nil
  end

end