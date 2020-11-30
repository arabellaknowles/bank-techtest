class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def check_balance
    @balance
  end
end
