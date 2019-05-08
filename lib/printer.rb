module Printer
  HEADER = "date || credit || debit || balance"

  def self.print(entries)
    puts HEADER
    entries.reverse.each do |entry|
      puts format_entry(entry)
    end
  end

  private_class_method

  def self.format_entry(entry)
    output = ["#{entry.date} "]
    output << (entry.credit ? " #{entry.credit} " : " ")
    output << (entry.debit ? " #{entry.debit} " : " ")
    output << " #{entry.balance}"
    output.join("||")
  end
end
