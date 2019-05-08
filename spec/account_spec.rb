require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe '#deposit' do
    it "Returns the correct balance after one deposit made" do
      expect(account.deposit(1000)).to eq 1000
    end

    it "Returns the correct balance after two deposits made" do
      account.deposit(2000)
      expect(account.deposit(1000)).to eq 3000
    end

    it "Creates a transaction with the correct parameters" do
      transaction_class = double(:transaction_class)
      printer = double(:printer)
      account = described_class.new(printer, transaction_class)
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
      transaction_class = double(:transaction_class)
      printer = double(:printer)
      account = described_class.new(printer, transaction_class)
      Timecop.freeze()
      expect(transaction_class).to receive(:new).with(-1, -1, Time.now)
      account.withdraw(1)
    end
  end

  describe 'updating account' do
    it "Returns the correct balance after deposits and withdrawals made" do
      account.deposit(100)
      account.deposit(200)
      account.withdraw(50)
      expect(account.withdraw(100)).to eq 150
    end
  end

  describe '#print_statement' do
    let(:printer) { double(:printer) }

    context "on a new account" do
      it "passes an empty array to the print method" do
        account = described_class.new(printer)
        expect(printer).to receive(:print).with([])
        account.print_statement
      end
    end

    context "on an account with a deposit and a withdrawal" do
      it "passes an array with the deposits to the print method" do
        transaction1 = double(:transaction)
        transaction2 = double(:transaction)
        transaction_class = double(:transaction_class)
        allow(transaction_class).to receive(:new)
          .and_return(transaction1, transaction2)
        
        account = described_class.new(printer, transaction_class)
        account.deposit(100)
        account.withdraw(200)
        expect(printer).to receive(:print).with([transaction1, transaction2])
        account.print_statement
      end
    end
  end
end
