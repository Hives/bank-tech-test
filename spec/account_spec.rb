require 'account'

describe Account do
  subject(:account) { described_class.new(printer, transaction_class) }

  let(:transaction_class) { double(:transaction_class) }
  let(:transaction1) { double(:transaction) }
  let(:transaction2) { double(:transaction) }
  let(:printer) { double(:printer) }

  before(:each) do
    allow(transaction_class).to receive(:new)
  end

  describe '#deposit' do
    it "Returns the correct balance after one deposit made" do
      expect(account.deposit(1000)).to eq 1000
    end

    it "Returns the correct balance after two deposits made" do
      account.deposit(2000)
      expect(account.deposit(1000)).to eq 3000
    end

    it "Creates a transaction with the correct parameters" do
      Timecop.freeze()
      expect(transaction_class).to receive(:new).with(1, 1, Time.now) 
      account.deposit(1)
    end
  end

  describe '#withdraw' do
    it "Returns the correct balance after one withdrawal made" do
      expect(account.withdraw(1000)).to eq(-1000)
    end

    it "Returns the correct balance after two withdrawals made" do
      account.withdraw(2000)
      expect(account.withdraw(1000)).to eq(-3000)
    end

    it "Creates a transaction with the correct parameters" do
      Timecop.freeze()
      expect(transaction_class).to receive(:new).with(-1, -1, Time.now)
      account.withdraw(1)
    end
  end

  describe 'updating account' do
    it "Returns the correct balance after deposits and withdrawals made" do
      account.deposit(100)
      account.withdraw(50)
      account.deposit(200)
      expect(account.withdraw(100)).to eq 150
    end
  end

  describe '#print_statement' do
    context "on a new account" do
      it "passes an empty array to the print method" do
        expect(printer).to receive(:print).with([])
        account.print_statement
      end
    end

    context "on an account with a deposit and a withdrawal" do
      it "passes an array with the deposits to the print method" do
        allow(transaction_class).to receive(:new)
          .and_return(transaction1, transaction2)
        
        account.deposit(100)
        account.withdraw(200)
        expect(printer).to receive(:print).with([transaction1, transaction2])
        account.print_statement
      end
    end
  end
end
