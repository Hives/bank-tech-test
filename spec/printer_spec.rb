require 'printer'

describe Printer do
  describe '.print' do
    subject(:Printer) { described_class }

    it "`puts` out just the header if no entries" do
      expect(STDOUT).to receive(:puts)
        .with("date || credit || debit || balance")
      Printer.print([])
    end

    it "`puts` out the header and entries in the right order" do
      transaction1 = double(:transaction1)
      allow(transaction1).to receive(:balance).and_return "100.00"
      allow(transaction1).to receive(:date).and_return "06/05/2019"
      allow(transaction1).to receive(:credit).and_return "100.00"
      allow(transaction1).to receive(:debit).and_return nil

      transaction2 = double(:transaction2)
      allow(transaction2).to receive(:balance).and_return "400.00"
      allow(transaction2).to receive(:date).and_return "07/05/2019"
      allow(transaction2).to receive(:credit).and_return nil
      allow(transaction2).to receive(:debit).and_return "300.00"

      expect(STDOUT).to receive(:puts)
        .with("date || credit || debit || balance\n"\
              "07/05/2019 || || 300.00 || 400.00\n"\
              "06/05/2019 || 100.00 || || 100.00")
      Printer.print([transaction1, transaction2])
    end
  end
end
