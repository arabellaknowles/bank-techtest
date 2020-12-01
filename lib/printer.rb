class Printer
  attr_reader :formatted_bank_statement

  def initialize(bank_statement)
    @formatted_bank_statement = bank_statement.format
  end

  def print
    puts @formatted_bank_statement
  end
end
