class Oystercard

  attr_accessor :balance
  MAX_BALANCE = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "Exceeding balance limit #{MAX_BALANCE}" if balance + amount > 90

    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

end
