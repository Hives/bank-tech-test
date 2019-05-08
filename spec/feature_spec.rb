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

  it 'prints the correct statement after deposits and withdrawals' do
    account = Account.new
    Timecop.freeze(date1)
    account.deposit(1000)
    Timecop.freeze(date2)
    account.deposit(2000)
    Timecop.freeze(date3)
    account.withdraw(500)
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance\n"\
            "14/01/2012 || || 500.00 || 2500.00\n"\
            "13/01/2012 || 2000.00 || || 3000.00\n"\
            "10/01/2012 || 1000.00 || || 1000.00")
    account.print_statement
  end
end
