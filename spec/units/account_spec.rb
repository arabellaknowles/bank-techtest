require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe "#initialize" do 
    let(:csv_file) { double("CSV file") }

    it "initializes with a new csv file" do
      CSV.stub(:open).and_return(csv_file)
      expect(account.csv).to eq(csv_file)
    end
  end

  describe "#balance" do 
    it "returns the balance" do
      expect(account.check_balance).to eq(0)
    end
  end

  describe "#deposit" do
    it "adds £10 to balance" do
      account.deposit(10)
      expect(account.check_balance).to eq(10)
    end
  end

  describe "#withdraw" do
    it "removes £10 from the balance" do
      account.deposit(20)
      account.withdraw(10)
      expect(account.check_balance).to eq(10)
    end
  end
end