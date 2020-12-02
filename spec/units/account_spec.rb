require 'account'

describe Account do
  subject(:account) { described_class.new }
 
  before do
    allow(subject).to receive(:date).and_return('03/12/2020')
  end

  describe '#balance' do
    it 'returns the balance' do
      expect(account.check_balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'adds £10 to balance' do
      account.deposit(10)
      expect(account.check_balance).to eq(10)
    end

    it 'calls the add_to_transactions_array method' do
      expect(account).to receive(:add_to_transactions_array).with(10)
      account.deposit(10)
    end

    it 'adds deposit action to transaction array' do
      account.deposit(10)
      expect(account.transactions).to eq([['03/12/2020', '10.00', '', '10.00']])
    end
  end

  describe '#withdraw' do
    it 'removes £10 from the balance' do
      account.deposit(20)
      account.withdraw(10)
      expect(account.check_balance).to eq(10)
    end

    it 'returns updated csv file' do
      account.deposit(20)
      account.withdraw(10)
      expect(account.transactions).to eq([['03/12/2020', '20.00', '', '20.00'], ['03/12/2020', '', '10.00', '10.00']])
    end
  end
end
