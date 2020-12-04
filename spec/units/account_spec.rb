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
    it 'returns the transaction array with the added deposit transaction' do
      expect(account.deposit(10)).to eq([['03/12/2020', '10.00', '', '10.00']])
    end
  end

  describe '#withdraw' do
    it 'returns the transaction array with the added withdraw transaction' do
      account.deposit(50)
      expect(account.withdraw(10)).to eq([["03/12/2020", "50.00", "", "50.00"], ['03/12/2020', '', '10.00', '40.00']])
    end
  end
end
