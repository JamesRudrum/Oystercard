require_relative './station'

class Oystercard

  attr_accessor :balance
  attr_reader :entry_station
  attr_reader :journeys

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    fail "Max balance limit #{MAX_BALANCE}" if balance + amount > MAX_BALANCE

    @balance += amount
  end

  def touch_in(entry_station)
    fail "not enough money on card" if balance < MIN_FARE

    # push the entry station as key
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    journey_log(entry_station, exit_station)
    @entry_station = nil
    deduct(MIN_FARE)
  end

  def journey_log(entry_station, exit_station)
    journey = {
      entry_station: entry_station,
      exit_station: exit_station
    }
    @journeys << journey
  end

private

  def deduct(fare)
    @balance -= fare
  end
end
