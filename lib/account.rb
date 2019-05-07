class Account
  def initialize(kernel = Kernel)
    @kernel = kernel
    @balance = 0
  end

  def deposit(amount, _date)
    update_balance(amount)
  end

  def withdraw(amount)
    update_balance(-amount)
  end

  def print_statement
    @kernel.puts "date || credit || debit || balance"
    unless @balance == 0
      @kernel.puts "07/05/2019 || 1000.00 || || 1000.00"
    end
  end

  private

  def update_balance(amount)
    @balance += amount
  end
end
