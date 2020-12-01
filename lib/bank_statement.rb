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

end
