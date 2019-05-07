class Account
  def initialize(kernel = Kernel)
    @kernel = kernel
    @balance = 0
    @entries = []
  end

  def deposit(amount, date)
    update_balance(amount)
    @entries.push({ amount: amount,
                    date: date.gsub('-', '/'),
                    balance: @balance })
    @balance
  end

  def withdraw(amount)
    update_balance(-amount)
  end

  def print_statement
    @kernel.puts "date || credit || debit || balance"
    @entries.reverse.each do |entry|
      @kernel.puts "#{entry[:date]} || #{sprintf('%.2f', entry[:amount])} || || #{sprintf('%.2f', entry[:balance])}"
    end
  end

  private

  def update_balance(amount)
    @balance += amount
  end
end
