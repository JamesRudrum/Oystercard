class Oystercard

  attr_accessor :balance
  MAX = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "Exceeding balance limit #{MAX}" if balance + amount > 90

    @balance += amount
  end

end
