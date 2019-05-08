module Printer
  def self.print(entries)
    puts "date || credit || debit || balance"
    entries.reverse.each do |e|
      if e.amount[0] == "-"
        puts "#{e.date} || || #{e.amount[1..-1]} || #{e.balance}"
      else
        puts "#{e.date} || #{e.amount} || || #{e.balance}"
      end
    end
  end
end
