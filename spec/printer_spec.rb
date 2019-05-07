require 'printer'

describe Printer do
  describe '.print' do
    subject(:Printer) { described_class }

    it { is_expected.to respond_to(:print).with(1).argument }

    it "puts out just the header if no entries" do
      expect(STDOUT).to receive(:puts)
        .with("date || credit || debit || balance")
      Printer.print([])
    end

    it "puts out the header and entry if 1 entry" do
      entry = double(:entry)
      allow(entry).to receive(:balance).and_return "100.00"
      allow(entry).to receive(:date).and_return "07/05/2019"
      allow(entry).to receive(:amount).and_return "100.00"
      expect(STDOUT).to receive(:puts)
        .with("date || credit || debit || balance").ordered
      expect(STDOUT).to receive(:puts)
        .with("07/05/2019 || 100.00 || || 100.00").ordered
      Printer.print([entry])
    end
  end
end
