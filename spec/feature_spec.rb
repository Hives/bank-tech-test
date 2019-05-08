
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

  it 'prints the header and entry details after a withdrawal' do
    account = Account.new
    account.withdraw(200, '07/05/2019')
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance").ordered
    expect(STDOUT).to receive(:puts)
      .with("07/05/2019 || || 200.00 || -200.00").ordered
    account.print_statement
  end

  it 'prints the correct statement after deposits and withdrawals' do
    account = Account.new
    account.deposit(1000, '10/01/2012')
    account.deposit(2000, '13/01/2012')
    account.withdraw(500, '14/01/2012')
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance").ordered
    expect(STDOUT).to receive(:puts)
      .with("14/01/2012 || || 500.00 || 2500.00").ordered
    expect(STDOUT).to receive(:puts)
      .with("13/01/2012 || 2000.00 || || 3000.00").ordered
    expect(STDOUT).to receive(:puts)
      .with("10/01/2012 || 1000.00 || || 1000.00").ordered
    account.print_statement
  end
end
