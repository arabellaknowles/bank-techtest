require 'csv'

class Account
  attr_reader :csv

  def initialize
    @balance = 0
    @csv = new_csv
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

  def new_csv
    CSV.open("statement.csv", "a+") do |hdr|
      hdr << ["date","credit","debit","balance"]
    end
  end

  def save_action(credit = "", debit = "", filename = "statement.csv")
    CSV.open(filename, "a") do |file|
      file << ["#{date}","#{credit}","#{debit}","#{check_balance}"]
    end
  end

  def date
    Time.now.strftime("%m/%d/%Y")
  end
end
