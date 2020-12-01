require 'account'
require 'bank_statement'

describe "Deposits and withdrawals are shown on bank statement" do
  it "User creates new account, deposits £100, withdraws £50 and prints statement" do
    ellas_account = Account.new
    ellas_account.deposit(2000)
    ellas_account.withdraw(100)
    ellas_statement = BankStatement.new
    expect(ellas_statement.print).to eq("date || credit || debit || balance\n12/01/2020 || 2000 ||  || 2000\n12/01/2020 ||  || 100 || 1900")
  end
end
describe "Multiple accounts created" do
  it "Users create new account, deposits £100, withdraws £50 and prints statement" do
    ellas_account = Account.new
    ellas_account.deposit(2000)
    ellas_account.withdraw(100)
    bellas_account = Account.new
    bellas_account.deposit(3000)
    bellas_account.withdraw(100)
    bellas_statement = BankStatement.new
    expect(bellas_statement.print).to eq("date || credit || debit || balance\n12/01/2020 || 3000 ||  || 3000\n12/01/2020 ||  || 100 || 2900")
  end
end