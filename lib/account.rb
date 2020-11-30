require 'csv'

class Account
  attr_reader :csv
  def initialize
    @balance = 0
    @csv = CSV.open("statement.csv", "a+") do |hdr|
      hdr << ["date","credit","debit","balance\n"] if csv.count.eql? 0
    end
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
