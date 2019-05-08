require 'entry'

describe Entry do
  before(:each) do
    @entry = Entry.new(100, Time.new(2019, 05, 07, 11, 00), 900)
  end

  describe '#amount' do
    it 'returns the amount formatted to 2 decimal places' do
      expect(@entry.amount).to eq "100.00"
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
