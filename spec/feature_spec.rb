
describe 'Feature tests' do
  it 'prints just the header for a new account' do
    account = Account.new
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance")
    account.print_statement
  end

  it 'prints the header and entry details after a deposit' do
    account = Account.new
    account.deposit(200, '07/05/2019')
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance").ordered
    expect(STDOUT).to receive(:puts)
      .with("07/05/2019 || 200.00 || || 200.00").ordered
    account.print_statement
  end
end
