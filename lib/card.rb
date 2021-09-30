# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :journey_log #
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1 #might want to move this, lives in journey atm

  def initialize#(journey = Journey) # might go altogether something like? (journey = JourneyLog.new.new_journey)
    @balance = DEFAULT_BALANCE
    # @list_of_journeys = [] ##
    # @journey_class = journey # might become @journey_log = JourneyLog.new
    # @current_journey = nil #
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise "This exceeds max balance of #{MAX_BALANCE}" if exceeds_max_balance(amount)
    @balance += amount
  end

  def touch_in(station_name) 
    raise 'Cannot touch in, balance is below min balance' if below_min_balance?
    raise 'Cannot touch in, already on journey' if @journey_log.on_journey?

    # @current_journey = @journey_class.new # no need for this 
    # @current_journey.start(station_name) 
    @journey_log.start_journey(station_name) #this might go into the above?
  end

  def touch_out(station_name)
    raise 'Cannot touch out, not on a journey' unless @journey_log.on_journey? #change to !@journey_log.current_journey.nil?

    charge
    # @current_journey.end(station_name) 
    @journey_log.end_journey(station_name)
    # store_journey # this might go into the above?
  end

  private

  def exceeds_max_balance(amount)
    @balance + amount > MAX_BALANCE
  end

  def below_min_balance?
    @balance < MIN_FARE
  end

  # def on_journey?
  #   !@current_journey.nil? # !@journey_log.current_journey.nil?
  # end

  # def store_journey
  #   @list_of_journeys.append(@current_journey) # will probably disappear altogether
  # end

  def charge
    @balance -= @journey_log.current_journey.fare
  end

end
