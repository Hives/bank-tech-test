describe 'Feature tests' do
  let(:date1) { Time.local(2012, 01, 10, 11, 0, 0) }
  let(:date2) { Time.local(2012, 01, 13, 11, 0, 0) }
  let(:date3) { Time.local(2012, 01, 14, 11, 0, 0) }

  it 'prints just the header for a new account' do
    account = Account.new
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance")
    account.print_statement
  end

  it 'prints the header and entry details after a deposit' do
    account = Account.new
    Timecop.freeze(date1)
    account.deposit(200)
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance").ordered
    expect(STDOUT).to receive(:puts)
      .with("10/01/2012 || 200.00 || || 200.00").ordered
    account.print_statement
  end

  it 'prints the header and entry details in the right order after two deposits' do
    account = Account.new
    Timecop.freeze(date1)
    account.deposit(200)
    Timecop.freeze(date2)
    account.deposit(400)
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance").ordered
    expect(STDOUT).to receive(:puts)
      .with("13/01/2012 || 400.00 || || 600.00").ordered
    expect(STDOUT).to receive(:puts)
      .with("10/01/2012 || 200.00 || || 200.00").ordered
    account.print_statement
  end

  it 'prints the header and entry details after a withdrawal' do
    account = Account.new
    Timecop.freeze(date1)
    account.withdraw(200)
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance").ordered
    expect(STDOUT).to receive(:puts)
      .with("10/01/2012 || || 200.00 || -200.00").ordered
    account.print_statement
  end

  it 'prints the correct statement after deposits and withdrawals' do
    account = Account.new
    Timecop.freeze(date1)
    account.deposit(1000)
    Timecop.freeze(date2)
    account.deposit(2000)
    Timecop.freeze(date3)
    account.withdraw(500)
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
