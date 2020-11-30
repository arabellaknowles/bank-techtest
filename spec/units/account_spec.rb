require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe "#initialize" do
    it 'initializes with a balance of 0' do
      expect(account.balance).to eq(0)
    end
  end

  describe "#balance" do 
    it "returns the balance" do
      expect(account.check_balance()).to eq(0)
    end
  end
end