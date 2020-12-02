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
    @transactions << [date.to_s, format_transaction_amount(credit), format_transaction_amount(debit), format_transaction_amount(check_balance)]
  end

  def format_transaction_amount(action)
    action == '' ? '' : add_two_decimals(action)
  end

  def add_two_decimals(string_number)
    '%.2f' % string_number.to_f
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end
end
