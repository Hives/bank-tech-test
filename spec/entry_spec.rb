require 'entry'

describe Entry do
  context "a deposit" do
    before(:each) do
      @entry = Entry.new(100, 900, Time.new(2019, 05, 07, 11, 00))
    end

    describe '#credit' do
      it 'returns the amount formatted to 2 decimal places' do
        expect(@entry.credit).to eq "100.00"
      end
    end

    describe '#debit' do
      it 'returns nil' do
        expect(@entry.debit).to eq nil
      end
    end

    describe '#balance' do
      it 'returns the balance formatted to 2 decimal places' do
        expect(@entry.balance).to eq "900.00"
      end
    end

    describe '#date' do
      it 'returns the date formatted as DD/MM/YYYY' do
        expect(@entry.date).to eq '07/05/2019'
      end
    end
  end

  context "a withdrawal" do
    before(:each) do
      @entry = Entry.new(-100, 900, Time.new(2019, 05, 07, 11, 00))
    end

    describe '#credit' do
      it 'returns nil' do
        expect(@entry.credit).to eq nil
      end
    end

    describe '#debit' do
      it 'returns the amount formatted to 2 decimal places' do
        expect(@entry.debit).to eq "100.00"
      end
    end

    describe '#balance' do
      it 'returns the balance formatted to 2 decimal places' do
        expect(@entry.balance).to eq "900.00"
      end
    end

    describe '#date' do
      it 'returns the date formatted as DD/MM/YYYY' do
        expect(@entry.date).to eq '07/05/2019'
      end
    end
  end
end
