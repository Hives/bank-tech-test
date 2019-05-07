module Printer
  def self.print(entries)
    puts "date || credit || debit || balance"
    entries.each do |e|
      puts "#{e.date} || #{e.amount} || || #{e.balance}"
    end
  end
end
