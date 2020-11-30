require 'account'

describe Account do
  subject(:account) { described_class.new }

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