# frozen_string_literal: true

class Oystercard
  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90

  def initialize
    @balance = DEFAULT_BALANCE
    @on_journey = false
  end

  def top_up(amount)
    raise "This exceeds max balance of #{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "Cannot touch in, already on journey" if @on_journey
    @on_journey = true
  end

  def touch_out
    raise "Cannot touch out, not on a journey" if not @on_journey
    @on_journey = false
  end

end
