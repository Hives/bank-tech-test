require 'account'

describe Account do
  describe '#deposit' do
    subject(:account) { described_class.new }

    it { is_expected.to respond_to(:deposit).with(1).argument }

    it "Returns the balance after one deposit made" do
      expect(account.deposit(1000)).to eq 1000
    end

    it "Returns the balance after two deposits made" do
      account.deposit(2000)
      expect(account.deposit(1000)).to eq 3000
    end
  end
end
