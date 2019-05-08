module Printer
  HEADER = "date || credit || debit || balance"

  def self.print(transactions)
    puts HEADER
    transactions.reverse.each do |transaction|
      puts format_entry(transaction)
    end
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
