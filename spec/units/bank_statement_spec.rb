require 'bank_statement'

describe BankStatement do
  let(:account) { double('account') }
  subject(:bank_statement) { described_class.new(account) }
  let(:account_transactions) { [["01/12/2020", "20", "", "20"], ["01/12/2020", "", "10", "10"]] }

  describe '#initialize' do
    it 'initializes with an account' do
      expect(bank_statement.account).to eq(account)
    end
  end
end