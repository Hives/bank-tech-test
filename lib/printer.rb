module Printer
  def self.print(entries)
    puts "date || credit || debit || balance"
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
