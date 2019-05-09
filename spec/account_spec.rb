require 'account'

describe Account do
  subject(:account) { described_class.new(formatter) }
  let(:formatter) { double(:formatter) }

  describe '#deposit' do
    it "Returns the correct balance after one deposit made" do
      expect(account.deposit(1000)).to eq 1000
    end

    it "Returns the correct balance after two deposits made" do
      account.deposit(2000)
      expect(account.deposit(1000)).to eq 3000
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
  end

  describe 'updating account' do
    it "Returns the correct balance after deposits and withdrawals made" do
      account.deposit(100)
      account.withdraw(50)
      account.deposit(200)
      expect(account.withdraw(100)).to eq 150
    end
  end

  describe '#transactions' do
    it 'returns the transactions' do
      account.deposit(2000)

      Timecop.freeze(Time.local(2019, 05, 06))
      account.withdraw(500)

      transactions = account.transactions
      expect(transactions.last.date).to eq Time.now
      expect(transactions.last.credit).to eq nil
      expect(transactions.last.debit).to eq 500
      expect(transactions.last.balance).to eq 1500
    end
  end

  describe '#print_statement' do
    it "passes the transactions to the formatter" do
      account.deposit(8)
      account.withdraw(1)
      expect(formatter).to receive(:format_statement).with(account.transactions)
      account.print_statement
    end

    it "prints the formatted statement" do
      allow(formatter).to receive(:format_statement).and_return("the statement")
      expect(STDOUT).to receive(:puts).with("the statement")
      account.print_statement
    end
  end
end
