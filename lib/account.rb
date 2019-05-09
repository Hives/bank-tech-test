require_relative './formatter'

class Account

  attr_reader :transactions

  Transaction = Struct.new(:date, :credit, :debit, :balance)

  def initialize(formatter = Formatter, transaction = Transaction)
    @formatter = formatter
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    update_balance(amount)
    @transactions.push(Transaction.new(Time.now, amount, nil, @balance))
    @balance
  end

  def withdraw(amount)
    update_balance(-amount)
    @transactions.push(Transaction.new(Time.now, nil, amount, @balance))
    @balance
  end

  def print_statement
    puts @formatter.format_statement(@transactions)
  end

  private

  def update_balance(amount)
    @balance += amount
  end

end
