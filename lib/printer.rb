module Printer
  HEADER = "date || credit || debit || balance"

  def self.print(entries)
    puts HEADER
    entries.reverse.each do |entry|
      puts format_entry(entry)
    end
  end

  private

  def self.format_entry(e)
    output = ["#{e.date} "]
    output << (e.credit ? " #{e.credit} " : " ")
    output << (e.debit ? " #{e.debit} " : " ")
    output << " #{e.balance}"
    output.join("||")
  end
end
