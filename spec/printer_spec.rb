require 'printer'

describe Printer do
  describe '.print' do
    subject(:Printer) { described_class }
    it { is_expected.to respond_to(:print) }
  end
end
