require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(2).argument }

    it "Returns the correct balance after one deposit made" do
      expect(account.deposit(1000, '07/05/2019')).to eq 1000
    end

    it "Returns the correct balance after two deposits made" do
      account.deposit(2000, '06/05/2019')
      expect(account.deposit(1000, '07/05/2019')).to eq 3000
    end
  end

  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(2).argument }

    it "Returns the correct balance after one withdrawal made" do
      expect(account.withdraw(1000, '07/05/2019')).to eq(-1000)
    end

    it "Returns the correct balance after two withdrawals made" do
      account.withdraw(2000, '07/05/2019')
      expect(account.withdraw(1000, '07/05/2019')).to eq(-3000)
    end
  end

  describe 'updating account' do
    it "Returns the correct balance after deposits and withdrawals made" do
      account.deposit(100, '04/05/2019')
      account.deposit(200, '05/05/2019')
      account.withdraw(50, '07/05/2019')
      expect(account.withdraw(100, '07/05/2019')).to eq 150
    end
  end

  describe '#print_statement' do
    let(:printer) { double(:printer) }

    it { is_expected.to respond_to(:print_statement).with(0).arguments }

    context "on a new account" do
      it "passes an empty array to the print method" do
        account = described_class.new(printer)
        expect(printer).to receive(:print).with([])
        account.print_statement
      end
    end

    context "on an account with a deposit and a withdrawal" do
      it "passes an array with the deposits to the print method" do
        entry1 = double(:entry)
        entry2 = double(:entry)
        entry_class = double(:entry_class)
        allow(entry_class).to receive(:new)
          .and_return(entry1, entry2)
        
        account = described_class.new(printer, entry_class)
        account.deposit(100, 'date')
        account.withdraw(200, 'date')
        expect(printer).to receive(:print).with([entry1, entry2])
        account.print_statement
      end
    end
  end
end
