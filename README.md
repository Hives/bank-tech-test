# Bank tech test

*[Instructions](instructions.md)*

## Nouns and verbs

Nouns
- client
- deposit
- withdrawal
  - more generally, deposit + withdrawal could be recorded internally as an entry (+ve/-ve)
- statement
- date

Verbs
- (make a) deposit
- (make a) withdrawal
- print

## Feature spec

In irb:
```ruby
> account = Account.new
> account.deposit(1000, 10-01-2012)
 => 1000.00
> account.deposit(2000, 13-01-2012)
 => 3000.00
> account.withdraw(500, 14-01-2012)
 => 2500.00
> account.print_statement
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
 => nil
```
