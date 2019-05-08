class Entry
  def initialize(amount, date, balance)
    @amount = amount
    @balance = balance
    @date = date
  end

  def amount
    sprintf('%.2f', @amount)
  end

  def balance
    sprintf('%.2f', @balance)
  end

  def date
    @date.strftime "%d/%m/%Y"
  end
end
