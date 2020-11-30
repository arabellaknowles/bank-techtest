require 'csv'

class Account
  attr_reader :csv

  def initialize
    @balance = 0
    @csv = CSV.open("statement.csv", "a+") do |hdr|
      hdr << ["date","credit","debit","balance\n"]
    end
  end

  def check_balance
    @balance
  end

  def deposit(amount)
    @balance += amount
    save_credit(amount)
  end

  def withdraw(amount)
    @balance -= amount
  end

  private

  def save_credit(amount)
    @csv = CSV.open("statement.csv", "a+") do |file|
      file << ["#{date}","#{amount}","","#{check_balance}\n"]
    end
  end

  def date
    Time.now.strftime("%m/%d/%Y")
  end

end
