class Station
  attr_reader :name, :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end

=begin
require './lib/journey'
require './lib/station'
s1 = Station.new("Bank", 1)
s2 = Station.new("Angel", 1)
s3 = Station.new("Wapping", 2)
=end
require "./lib/card.rb"
require "./lib/charge.rb"
require "./lib/journey_log.rb"
require "./lib/journey"
require "./lib/station"
card= Oystercard.new
card.top_up(85)
s1 = Station.new("Bank", 1)
s2 = Station.new("Angel", 1)
s3 = Station.new("Wapping", 2)
s4 = Station.new("High Barnet", 5)
