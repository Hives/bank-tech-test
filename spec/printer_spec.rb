require 'printer'

describe Printer do
  describe '.print' do
    subject(:Printer) { described_class }

    it "`puts` out just the header if no entries" do
      expect(STDOUT).to receive(:puts)
        .with("date || credit || debit || balance")
      Printer.print([])
    end

    it "`puts` out the header and entry in the right order if deposit and withdrawal" do
      entry1 = double(:entry1)
      allow(entry1).to receive(:balance).and_return "100.00"
      allow(entry1).to receive(:date).and_return "06/05/2019"
      allow(entry1).to receive(:credit).and_return "100.00"
      allow(entry1).to receive(:debit).and_return nil

      entry2 = double(:entry2)
      allow(entry2).to receive(:balance).and_return "400.00"
      allow(entry2).to receive(:date).and_return "07/05/2019"
      allow(entry2).to receive(:credit).and_return nil
      allow(entry2).to receive(:debit).and_return "300.00"

      expect(STDOUT).to receive(:puts)
        .with("date || credit || debit || balance").ordered
      expect(STDOUT).to receive(:puts)
        .with("07/05/2019 || || 300.00 || 400.00").ordered
      expect(STDOUT).to receive(:puts)
        .with("06/05/2019 || 100.00 || || 100.00").ordered
      Printer.print([entry1, entry2])
    end
  end
end
