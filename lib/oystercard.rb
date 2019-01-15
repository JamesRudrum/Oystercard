class Oystercard

  attr_accessor :balance
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize(balance = 0, status = false)
    @balance = balance
    @status = status
  end

  def top_up(amount)
    fail "Exceeding balance limit #{MAX_BALANCE}" if balance + amount > 90

    @balance += amount
  end

  def in_journey?
    @status
  end

  def touch_in(station)
    if balance < MIN_FARE
      fail "not enough money on card"
    else
      @entry_station = station
      @status = true
    end
  end

  def touch_out
    deduct(MIN_FARE)

    @status = false
  end

private

  def deduct(fare)
    @balance -= fare
  end

end
