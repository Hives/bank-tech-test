require 'printer'

class Account
  def initialize(printer = Printer)
    @printer = printer
    @balance = 0
    @entries = []
  end

  def deposit(amount, date)
    update_balance(amount)
    @entries.push({ amount: amount,
                    date: date,
                    balance: @balance })
    @balance
  end

  def withdraw(amount)
    update_balance(-amount)
  end

  def print_statement
    @printer.print(@entries)
    # @kernel.puts "date || credit || debit || balance"
    # @entries.reverse.each do |entry|
    #   @kernel.puts "#{entry[:date]} || #{sprintf('%.2f', entry[:amount])} || || #{sprintf('%.2f', entry[:balance])}"
    # end
  end

  private

  def update_balance(amount)
    @balance += amount
  end
end
