require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe "#balance" do 
    it "returns the balance" do
      expect(account.check_balance()).to eq(0)
    end
  end
end