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
  end
end
