module Printer
  HEADER = "date || credit || debit || balance"

  def self.print(transactions)
    rows = transactions.reverse.map do |transaction|
      "\n" + format_entry(transaction)
    end.join
    puts HEADER + rows
  end

  private_class_method

  def self.format_entry(transaction)
    output = ["#{transaction.date} "]
    output << (transaction.credit ? " #{transaction.credit} " : " ")
    output << (transaction.debit ? " #{transaction.debit} " : " ")
    output << " #{transaction.balance}"
    output.join("||")
  end
end
