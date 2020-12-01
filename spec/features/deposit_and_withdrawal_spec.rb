require 'account'
require 'bank_statement'

describe 'Deposits and withdrawals are shown on bank statement' do
  it 'User creates new account, deposits £2000, withdraws £100 and prints statement' do
    ellas_account = Account.new
    ellas_account.deposit(2000)
    ellas_account.withdraw(100)
    ellas_statement = BankStatement.new(ellas_account)
    ellas_printer = Printer.new(ellas_statement)
    expect(STDOUT).to receive(:puts).with("date || credit || debit || balance\n01/12/2020 || 2000 ||  || 2000\n01/12/2020 ||  || 100 || 1900")
    ellas_printer.print
  end
end

describe 'Multiple accounts created' do
  it 'Users create new accounts, first user deposits and withdraws, second user deposits £3000, withdraws £100 and prints statement' do
    ellas_account = Account.new
    ellas_account.deposit(2000)
    ellas_account.withdraw(100)
    bellas_account = Account.new
    bellas_account.deposit(3000)
    bellas_account.withdraw(100)
    bellas_statement = BankStatement.new(bellas_account)
    bellas_printer = Printer.new(bellas_statement)
    expect(STDOUT).to receive(:puts).with("date || credit || debit || balance\n01/12/2020 || 3000 ||  || 3000\n01/12/2020 ||  || 100 || 2900")
    bellas_printer.print
  end

  it 'Users create new accounts, first user deposits and withdraws, second user deposits and withdraws, first users statement is printed' do
    ellas_account = Account.new
    ellas_account.deposit(2000)
    ellas_account.withdraw(100)
    bellas_account = Account.new
    bellas_account.deposit(3000)
    bellas_account.withdraw(100)
    bellas_statement = BankStatement.new(bellas_account)
    ellas_statement = BankStatement.new(ellas_account)
    ellas_printer = Printer.new(ellas_statement)
    expect(STDOUT).to receive(:puts).with("date || credit || debit || balance\n01/12/2020 || 2000 ||  || 2000\n01/12/2020 ||  || 100 || 1900")
    ellas_printer.print
  end
end
