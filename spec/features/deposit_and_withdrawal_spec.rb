require 'account'
require 'bank_statement'

describe 'Features' do
  before do
    allow_any_instance_of(Account).to receive(:date).and_return('03/12/2020')
  end

  describe 'Deposits and withdrawals are shown on bank statement' do
    it 'User creates new account, deposits £2000, withdraws £100 and prints statement' do
      ellas_account = Account.new
      ellas_account.deposit(2000)
      ellas_account.withdraw(100)
      ellas_statement = BankStatement.new(ellas_account)
      ellas_printer = Printer.new(ellas_statement)
      expect(STDOUT).to receive(:puts).with("date || credit || debit || balance\n03/12/2020 ||  || 100.00 || 1900.00\n03/12/2020 || 2000.00 ||  || 2000.00")
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
      expect(STDOUT).to receive(:puts).with("date || credit || debit || balance\n03/12/2020 ||  || 100.00 || 2900.00\n03/12/2020 || 3000.00 ||  || 3000.00")
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
      expect(STDOUT).to receive(:puts).with("date || credit || debit || balance\n03/12/2020 ||  || 100.00 || 1900.00\n03/12/2020 || 2000.00 ||  || 2000.00")
      ellas_printer.print
    end
  end
end
