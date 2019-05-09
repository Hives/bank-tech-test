require_relative './formatter'

class Account

  attr_reader :transactions

  Transaction = Struct.new(:date, :credit, :debit, :balance,
                           keyword_init: true)

  def initialize(formatter = Formatter, transaction = Transaction)
    @formatter = formatter
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    update_balance(amount)
    @transactions.push(Transaction.new(date: Time.now,
                                       credit: amount,
                                       debit: nil,
                                       balance: @balance))
    @balance
  end

  def withdraw(amount)
    update_balance(-amount)
    @transactions.push(Transaction.new(date: Time.now,
                                       credit: nil,
                                       debit: amount,
                                       balance: @balance))
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
