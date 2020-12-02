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
    @transactions << [date.to_s, format_with_decimals(credit), format_with_decimals(debit), format_with_decimals(check_balance)]
  end

  def format_with_decimals(number)
    number == '' ? '' : add_two_decimals(number)
  end

  def add_two_decimals(string_number)
    '%.2f' % string_number.to_f
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end
end
