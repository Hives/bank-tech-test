require_relative './entry'
require_relative './printer'

class Account
  def initialize(printer = Printer, entry = Entry)
    @printer = printer
    @entry = entry
    @balance = 0
    @entries = []
  end

  def deposit(amount)
    update_balance(amount)
    @entries.push(@entry.new(amount, @balance, Time.now))
    @balance
  end

  def withdraw(amount)
    update_balance(-amount)
    @entries.push(@entry.new(-amount, @balance, Time.now))
    @balance
  end

  def print_statement
    @printer.print(@entries)
    nil
  end

  private

  def update_balance(amount)
    @balance += amount
  end
end
