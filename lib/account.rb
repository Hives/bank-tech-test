require_relative './transaction'
require_relative './printer'

class Account
  def initialize(printer = Printer, transaction = Transaction)
    @printer = printer
    @transaction = transaction
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    update_account(amount)
    @balance
  end

  def withdraw(amount)
    update_account(-amount)
    @balance
  end

  def print_statement
    @printer.print(@transactions)
    nil
  end

  private

  def update_account(amount)
    @balance += amount
    @transactions.push(@transaction.new(amount, @balance, Time.now))
  end

end
