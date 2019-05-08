class Entry
  def initialize(amount, balance, date)
    @balance = balance
    @credit = amount.positive? ? amount : nil
    @date = date
    @debit = amount.negative? ? amount.abs : nil
  end

  def credit
    @credit ? format_two_decimal_places(@credit) : nil
  end

  def debit
    @debit ? format_two_decimal_places(@debit) : nil
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
