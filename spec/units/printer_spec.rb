require 'printer'

describe Printer do
  let(:statement) { double('bank_statement') }
  subject(:printer) { described_class.new(statement) }

  before do
    allow(statement).to receive(:format).and_return("date || credit || debit || balance\n03/12/2020 || 20.00 ||  || 20.00\n03/12/2020 ||  || 10.00 || 10.00")
  end

  describe '#print' do
    it 'prints out the bank statement' do
      expect(STDOUT).to receive(:puts).with("date || credit || debit || balance\n03/12/2020 || 20.00 ||  || 20.00\n03/12/2020 ||  || 10.00 || 10.00")
      printer.print
    end
  end
end
