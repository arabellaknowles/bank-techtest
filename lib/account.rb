require 'csv'

class Account
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def check_balance
    @balance
  end

  def deposit(amount)
    @balance += amount
    add_to_transactions_array(amount)
  end

  def withdraw(amount)
    @balance -= amount
    add_to_transactions_array('', amount)
  end

  private

  def add_to_transactions_array(credit = '', debit = '')
    @transactions << [date.to_s, credit.to_s, debit.to_s, check_balance.to_s]
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end
end
