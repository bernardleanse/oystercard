# frozen_string_liructeral: true

class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :list_of_journeys

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @entry_station = nil # can we remove this?
    @exit_station = nil # as above
    @list_of_journeys = []
  end

  def top_up(amount)
    raise "This exceeds max balance of #{MAX_BALANCE}" if @balance + amount > MAX_BALANCE

    @balance += amount
  end

  def touch_in(station_name)
    raise 'Cannot touch in, balance is below min balance' if below_min_balance?
    raise 'Cannot touch in, already on journey' if on_journey?
    @exit_station = nil
    @entry_station = station_name
  end

  def touch_out(station_name)
    raise 'Cannot touch out, not on a journey' unless on_journey?
    
    @exit_station = station_name
    @current_journey = { entry_station: entry_station, exit_station: exit_station }
    @list_of_journeys.append(@current_journey)
    deduct(MIN_FARE)
    @entry_station = nil
  end

  private

  def below_min_balance?
    @balance < MIN_FARE
  end

  def deduct(amount)
    @balance -= amount
  end

  def on_journey?
    # could switch to !!
    !entry_station.nil?
  end
end
