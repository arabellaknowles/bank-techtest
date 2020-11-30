require 'csv'

class BankStatement
  def print
    format_table
  end

  private

  def load(filename = "statement.csv")
    require 'csv'
    row_array = []
    statement_array = []

    CSV.foreach(filename) do |row|
      date, credit, debit, balance = row
      row_array = [date, credit, debit, balance]
      statement_array << row_array
    end

    statement_array
  end

  def format_table
    statement_array = load.map do |row_array|
      row_array.join( " || " )
    end
    statement_array.join( "\n" )
  end
end