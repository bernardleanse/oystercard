# frozen_string_literal: true

class Oystercard
  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(amount)
    raise "This exceeds max balance of #{MAX_BALANCE}" if @balance + amount > MAX_BALANCE

    @balance += amount
  end

  def at_max?
    @balance == MAX_BALANCE
  end
end
