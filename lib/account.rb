class Account
  def initialize
    @balance = 0
  end

  def deposit(amount)
    update_balance(amount)
  end

  def withdraw(amount)
    update_balance(-amount)
  end

  def print_statement
  end

  private

  def update_balance(amount)
    @balance += amount
  end
end
