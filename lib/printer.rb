module Printer
  def self.print(entries)
    puts "date || credit || debit || balance"
    entries.reverse.each do |e|
      output = ["#{e.date} "]
      output << (e.credit ? " #{e.credit} " : " ")
      output << (e.debit ? " #{e.debit} " : " ")
      output << " #{e.balance}"
      puts output.join("||")
    end
  end
end
