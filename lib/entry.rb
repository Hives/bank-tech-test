class Entry
  def initialize(amount, date, balance)
    @amount = amount
    @balance = balance
    @date = date
  end

  def amount
    format_two_decimal_places(@amount)
  end

  def balance
    format_two_decimal_places(@balance)
  end

  def date
    @date.strftime "%d/%m/%Y"
  end

  private

  def format_two_decimal_places(number)
    sprintf('%.2f', number)
  end
end
