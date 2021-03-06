require 'bank_statement'

describe BankStatement do
  let(:account) { double('account') }
  subject(:bank_statement) { described_class.new(account) }
  let(:account_transactions) { [['02/12/2020', '20.00', '', '20.00'], ['03/12/2020', '', '10.00', '10.00']] }

  describe '#format' do
    it 'returns account transaction data in table format in reverse chronological order' do
      allow(account).to receive(:transactions).and_return(account_transactions)
      expect(bank_statement.format).to eq("date || credit || debit || balance\n03/12/2020 ||  || 10.00 || 10.00\n02/12/2020 || 20.00 ||  || 20.00")
    end
  end
end
