
describe 'Feature tests' do
  it 'prints the right statment for two deposits' do
    account = Account.new
    account.deposit(500, "06/05/2019")
    account.deposit(700, "07/05/2019")
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance").ordered
    expect(STDOUT).to receive(:puts)
      .with("07/05/2019 || 700.00 || || 1200.00").ordered
    expect(STDOUT).to receive(:puts)
      .with("06/05/2019 || 500.00 || || 500.00").ordered
    account.print_statement
  end
end
