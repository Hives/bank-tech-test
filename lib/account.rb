class Account
  def initialize(kernel = Kernel)
    @kernel = kernel
    @balance = 0
  end

  def deposit(amount)
    update_balance amount
  end

  def withdraw(amount)
    update_balance -amount
  end

  def print_statement
    @kernel.puts "date || credit || debit || balance"
  end

  private

  def update_balance(amount)
    @balance += amount
  end
end
