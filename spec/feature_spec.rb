describe 'Feature tests' do
  it 'prints just the header for a new account' do
    account = Account.new
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance")
    account.print_statement
  end

  it 'prints the correct statement after deposits and withdrawals' do
    account = Account.new
    Timecop.freeze(Time.local(2012, 01, 10))
    account.deposit(1000)
    Timecop.freeze(Time.local(2012, 01, 13))
    account.deposit(2000)
    Timecop.freeze(Time.local(2012, 01, 14))
    account.withdraw(500)
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance\n"\
            "14/01/2012 || || 500.00 || 2500.00\n"\
            "13/01/2012 || 2000.00 || || 3000.00\n"\
            "10/01/2012 || 1000.00 || || 1000.00")
    account.print_statement
  end
end
