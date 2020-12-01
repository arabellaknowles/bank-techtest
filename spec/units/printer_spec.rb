require 'printer'

describe Printer do
  let(:statement) { double('bank_statement') }
  subject(:printer) { described_class.new(statement) }

  describe '#initialize' do
    it 'initializes with a formatted bankstatement' do
      allow(statement).to receive(:format).and_return("date || credit || debit || balance\n01/12/2020 || 20 ||  || 20\n01/12/2020 ||  || 10 || 10")
      expect(printer.formatted_bank_statement).to eq("date || credit || debit || balance\n01/12/2020 || 20 ||  || 20\n01/12/2020 ||  || 10 || 10")
    end
  end

end