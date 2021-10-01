class Charge
  MIN_FARE = 1
  PENALTY_FARE = 6
  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def amount
    return PENALTY_FARE if @exit_station.nil? || @entry_station.nil?
    amount =  (@entry_station.zone - @exit_station.zone).abs + 1
  end
end


  # MIN_FARE = 1
  # PENALTY_FARE = 6
  