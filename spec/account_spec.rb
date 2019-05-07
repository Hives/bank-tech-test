require 'account'

describe Account do
  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it "Returns the balance after one deposit made" do
      account = Account.new
      expect(account.deposit(1000)).to eq 1000
    end
  end
end
