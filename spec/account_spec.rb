require 'account'

describe Account do
  it { is_expected.to respond_to(:deposit).with(1).argument }
end
