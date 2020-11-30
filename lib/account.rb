class Account

  def initialize
    @balance = 0
  end

  def check_balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end
end
