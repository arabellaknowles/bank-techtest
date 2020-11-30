require 'bank_statement'

describe BankStatement do
  subject(:bank_statement) { described_class.new }

  describe '#print' do
    it 'prints loaded csv data in table format' do
      allow(bank_statement).to receive(:load).and_return([["date", "credit", "debit", "balance"], ["11/30/2020","20","","20"]])
      expect(bank_statement.print).to eq("date || credit || debit || balance\n11/30/2020 || 20 ||  || 20")
    end
  end
end