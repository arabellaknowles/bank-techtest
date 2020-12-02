require 'bank_statement'

describe BankStatement do
  let(:account) { double('account') }
  subject(:bank_statement) { described_class.new(account) }
  let(:account_transactions) { [['03/12/2020', '20', '', '20'], ['03/12/2020', '', '10', '10']] }

  describe '#format' do
    it 'returns account transaction data in table format' do
      allow(account).to receive(:transaction).and_return(account_transactions)
      expect(bank_statement.format).to eq("date || credit || debit || balance\n03/12/2020 || 20 ||  || 20\n03/12/2020 ||  || 10 || 10")
    end
  end
end
