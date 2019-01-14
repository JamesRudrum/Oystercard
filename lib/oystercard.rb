class Oystercard

  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "Exceeding balance limit" if balance + amount > 90

    @balance += amount
  end

end
