# Bank Tech Test
This is a Ruby application for managing bank accounts that can be used in irb. Users can deposit, withdraw and check balance. The user can print out their bank account statement which contains a table of transactions with the date, credit, debit and balance details. This application stores transaction information within memory, no database is used.

## Example of use:
A client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012   
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see  
date || credit || debit || balance  
14/01/2012 || || 500.00 || 2500.00  
13/01/2012 || 2000.00 || || 3000.00  
10/01/2012 || 1000.00 || || 1000.00  

## Set up
1) Fork and clone this repository
2) To install required dependencies, in your terminal, run:
```
$ bundle install
```
3) To enter irb, in your terminal, run
```
$ irb
```

## Using the app

**Creating an account:**
1) Require the account file:
```
> require './lib/account.rb'
```
2) To create a new account, run:
```
> new_account = Account.new
```

**Making transactions to your new account:**
- To deposit:
```
> new_account.deposit(50)
```
- To withdraw:
```
> new_account.withdraw(10)
```
- To check balance:
```
> new_account.check_balance
```

**Printing your bank statement:**
1) First you must create a bank statement, passing your account as the argument:
```
> require './lib/bank_statement.rb'
```
```
> bank_statement = BankStatement.new(new_account)
```
2) Then you must create a printer, passing your bank statement as the argument:
```
> require './lib/printer.rb'
```
```
> printer = Printer.new(bank_statement)
```
3) To print your statement:
```
> printer.print
```

## Testing
- To run rspec tests, in your terminal, run:
```
$ rspec
```

## Technologies used
- Coded in Ruby
- RSpec for testing
- Simplecov and Rubocop for code quality checks (100% coverage)
