require 'csv'

class Account
  attr_reader :transaction

  def initialize
    @balance = 0
    @transaction = []
  end

  def check_balance
    @balance
  end

  def deposit(amount)
    @balance += amount
    save_action(amount)
  end

  def withdraw(amount)
    @balance -= amount
    save_action("", amount)
  end

  private

  def save_action(credit = "", debit = "", filename = "statement.csv")
    @transaction << ["#{date}","#{credit}","#{debit}","#{check_balance}"]
  end

  def date
    Time.now.strftime("%d/%m/%Y")
  end
end
