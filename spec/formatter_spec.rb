require 'formatter'

describe Formatter do
  describe '.format_statement' do
    subject(:Formatter) { described_class }

    it "returns just the header if no entries" do
      expect(Formatter.format_statement([]))
        .to eq Formatter::HEADER
    end

    it "formats and returns the header, a credit and a debit in the right order" do
      transaction1 = double(:transaction1)
      allow(transaction1).to receive(:date).and_return Time.new(2019, 05, 06)
      allow(transaction1).to receive(:credit).and_return 100
      allow(transaction1).to receive(:debit).and_return nil
      allow(transaction1).to receive(:balance).and_return 100

      transaction2 = double(:transaction2)
      allow(transaction2).to receive(:date).and_return Time.new(2019, 05, 07)
      allow(transaction2).to receive(:credit).and_return nil
      allow(transaction2).to receive(:debit).and_return 300
      allow(transaction2).to receive(:balance).and_return 400

      statement = Formatter.format_statement([transaction1, transaction2])
      expect(statement).to eq "#{Formatter::HEADER}\n" +
                              "07/05/2019 || || 300.00 || 400.00\n"\
                              "06/05/2019 || 100.00 || || 100.00"
    end
  end
end
