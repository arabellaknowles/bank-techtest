require 'csv'

class BankStatement
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def format
    headers = "date || credit || debit || balance\n"
    headers + format_individual_transaction.reverse.join("\n")
  end

  private

  def format_individual_transaction
    @account.transactions.map do |row_array|
      row_array.join(' || ')
    end
  end
end
