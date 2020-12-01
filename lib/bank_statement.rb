require 'csv'

class BankStatement
  attr_reader :account

  def initialize(account)
    @account = account
  end


  def format
    statement_array = account.transaction.map do |row_array|
      row_array.join( " || " )
    end
    "date || credit || debit || balance\n" + statement_array.join( "\n" )
  end

  private

  def load(filename = "statement.csv")
    row_array = []
    statement_array = []

    CSV.foreach(filename) do |row|
      date, credit, debit, balance = row
      statement_array << create_row_array(date, credit, debit, balance)
    end

    statement_array
  end

  def create_row_array(date, credit, debit, balance)
    row_array = [date, credit, debit, balance]
  end

  def format_table
    statement_array = load.map do |row_array|
      row_array.join( " || " )
    end
    statement_array.join( "\n" )
  end
end