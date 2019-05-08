require_relative './entry'
require_relative './printer'

class Account
  def initialize(printer = Printer, entry = Entry)
    @printer = printer
    @entry = entry
    @balance = 0
    @entries = []
  end

  def deposit(amount, date)
    update_balance(amount)
    @entries.push(@entry.new(amount, date, @balance))
    @balance
  end

  def withdraw(amount, date)
    update_balance(-amount)
    @entries.push(@entry.new(-amount, date, @balance))
    @balance
  end

  def print_statement
    @printer.print(@entries)
  end

  private

  def update_balance(amount)
    @balance += amount
  end
end
