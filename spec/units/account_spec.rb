require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:csv_file) { double("CSV file") }

  before do
    CSV.stub(:open).and_return(csv_file)
  end

  describe "#initialize" do 
    it "initializes with a new csv file" do
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

    it "returns updated csv file" do
      expect(account.deposit(10)).to eq(csv_file)
    end
  end

  describe "#withdraw" do
    it "removes £10 from the balance" do
      account.deposit(20)
      account.withdraw(10)
      expect(account.check_balance).to eq(10)
    end

    it "returns updated csv file" do
      account.deposit(20)
      expect(account.withdraw(10)).to eq(csv_file)
    end
  end
end