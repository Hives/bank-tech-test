
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

  it 'prints the header and entry details in the right order after two deposits' do
    account = Account.new
    account.deposit(200, '06/05/2019')
    account.deposit(400, '07/05/2019')
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance").ordered
    expect(STDOUT).to receive(:puts)
      .with("07/05/2019 || 400.00 || || 600.00").ordered
    expect(STDOUT).to receive(:puts)
      .with("06/05/2019 || 200.00 || || 200.00").ordered
    account.print_statement
  end
end
