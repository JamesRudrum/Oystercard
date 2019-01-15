class Oystercard

  attr_accessor :balance
  MAX_BALANCE = 90

  def initialize(balance = 0, status = false)
    @balance = balance
    @status = status
  end

  def top_up(amount)
    fail "Exceeding balance limit #{MAX_BALANCE}" if balance + amount > 90

    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @status
  end

  def touch_in
    @status = true
  end

end
