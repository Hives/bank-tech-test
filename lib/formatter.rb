module Formatter
  HEADER = "date || credit || debit || balance"

  def self.format_statement(transactions)
    rows = transactions.reverse.map do |transaction|
      "\n" + format_transaction(transaction)
    end.join
    HEADER + rows
  end

  private_class_method

  def self.format_transaction(transaction)
    output = ["#{format_date(transaction.date)} "]
    output << (transaction.credit ?
               " #{two_decimal_places(transaction.credit)} " :
               " ")
    output << (transaction.debit ?
               " #{two_decimal_places(transaction.debit)} " :
               " ")
    output << " #{two_decimal_places(transaction.balance)}"
    output.join("||")
  end

  def self.two_decimal_places(number)
    sprintf('%.2f', number)
  end

  def self.format_date(date)
    date.strftime "%d/%m/%Y"
  end
end
