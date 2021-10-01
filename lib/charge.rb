class Charge
  MIN_FARE = 1
  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def amount
    amount = 0
    amount += MIN_FARE if @entry_station && @exit_station
    amount += MIN_FARE if (@entry_station.zone - @exit_station.zone).abs == 1
    amount
  end
end


  # MIN_FARE = 1
  # PENALTY_FARE = 6
  