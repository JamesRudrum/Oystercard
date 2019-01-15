class Oystercard

  attr_accessor :balance
  attr_reader :entry_station
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "Exceeding balance limit #{MAX_BALANCE}" if balance + amount > 90

    @balance += amount
  end

  def in_journey?
    @entry_station.nil? ? false : true
    # if @entry_station == nil
    #  false
    # else
    #  true
    # end
  end

  def touch_in(station)
    fail "not enough money on card" if balance < MIN_FARE
    
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FARE)

    @entry_station = nil
  end

private

  def deduct(fare)
    @balance -= fare
  end
end
