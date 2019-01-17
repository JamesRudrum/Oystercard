require_relative './station'
require_relative './journey'

class Oystercard

  attr_accessor :balance
  attr_reader :journey

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize(balance = 0, journey = Journey.new)
    @balance = balance
    @journey = journey
  end

  def top_up(amount)
    fail "Max balance limit #{MAX_BALANCE}" if balance + amount > MAX_BALANCE

    @balance += amount
  end

  def touch_in(entry_station)
    fail "not enough money on card" if balance < MIN_FARE

    @journey.log_entry(entry_station)

  end

  def touch_out(exit_station)
    deduct(MIN_FARE)

    @journey.log_exit(exit_station)
  end

private

  def deduct(fare)
    @balance -= fare
  end
end
