
describe 'Feature tests' do
  it 'prints just the header for a new account' do
    account = Account.new
    expect(STDOUT).to receive(:puts)
      .with("date || credit || debit || balance")
    account.print_statement
  end
end
