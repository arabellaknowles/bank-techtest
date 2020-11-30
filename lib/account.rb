require 'csv'

class Account
  attr_reader :csv
  def initialize
    @balance = 0
    @csv = CSV.open("statement.csv", "a+")
  end

  def check_balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
