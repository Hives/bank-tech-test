require 'transaction'

describe Transaction do
  context "a deposit" do
    subject(:transaction) do
      described_class.new(100, 900, Time.new(2019, 05, 07))
    end

    describe '#credit' do
      it 'returns the amount formatted to 2 decimal places' do
        expect(transaction.credit).to eq "100.00"
      end
    end

    describe '#debit' do
      it 'returns nil' do
        expect(transaction.debit).to eq nil
      end
    end

    describe '#balance' do
      it 'returns the balance formatted to 2 decimal places' do
        expect(transaction.balance).to eq "900.00"
      end
    end

    describe '#date' do
      it 'returns the date formatted as DD/MM/YYYY' do
        expect(transaction.date).to eq '07/05/2019'
      end
    end
  end

  context "a withdrawal" do
    subject(:transaction) do
      described_class.new(-100, 900, Time.new(2019, 05, 07))
    end

    describe '#credit' do
      it 'returns nil' do
        expect(transaction.credit).to eq nil
      end
    end

    describe '#debit' do
      it 'returns the amount formatted to 2 decimal places' do
        expect(transaction.debit).to eq "100.00"
      end
    end

    describe '#balance' do
      it 'returns the balance formatted to 2 decimal places' do
        expect(transaction.balance).to eq "900.00"
      end
    end

    describe '#date' do
      it 'returns the date formatted as DD/MM/YYYY' do
        expect(transaction.date).to eq '07/05/2019'
      end
    end
  end
end
