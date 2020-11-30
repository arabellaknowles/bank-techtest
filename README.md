# Bank Tech Test

## Set up
1) Fork and clone this repository
2) To install required dependencies, in your terminal, run:
```
bundle install
```


## Requirements
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance Criteria
**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

## Technologies used
- RSpec for testing
- Simplecov and rubocop for code quality checks

### Planning
- Method to withdraw from balance: @balance -= withdrawal_amount
- Method to deposit: @balance += deposit_amount
- Method that returns today's date
- Method to add the action, date, credit/debit amount, balance to the file
- Storing this in a file not a database: CSV (comma separated format)
- On intialization of a new account, create a new CSV linked to that account with date, credit, debit, balance columns


