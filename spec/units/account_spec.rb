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
      expect(account).to receive(:add_to_transactions_array).with(10).and_return([['03/12/2020', '10.00', '', '10.00']])
      account.deposit(10)
    end
  end

  describe '#withdraw' do
    it 'calls the add_to_transactions_array method' do
      account.deposit(50)
      expect(account).to receive(:add_to_transactions_array).with('', 10).and_return([['03/12/2020', '10.00', '', '40.00']])
      account.withdraw(10)
    end
  end
end
