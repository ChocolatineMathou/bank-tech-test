# Bank Tech Test

[![Build Status](https://travis-ci.org/ChocolatineMathou/bank-tech-test.svg?branch=master)](https://travis-ci.org/ChocolatineMathou/bank-tech-test)

## Intro

This project was made during the tech test week at Makers on week 10.  
It was built with Ruby and its testing framework RSpec, using OOD and TDD.  
Rubocop and SimpleCov were used from the beginning to improve the syntax and get the test coverage.

## User stories

```
As a user,
So that I can have less cash on my wallet,
I want to make a deposit on my account.

As a user,
So that I can have some cash to go shopping,
I want to withdraw money from my account.

As a user,
So that I can know if I'm spending too much money,
I want to print my bank statement.

As a user,
So that I can know when the operation happened,
I want to get the date.

As a user,
So that I wouldn't pay interests
I don't want to have an overdraft on my account.

As a user,
So that I can make actual operations,
I want to make sure that my input is accurate.

As a user,
So that I can read my bank statement easily,
I want to get the operations in reverse chronological order.
```

## Download and run project

```
$ git clone git@github.com:ChocolatineMathou/bank-tech-test.git
$ cd bank-tech-test
$ bundle install
```

Tests can be run using RSpec from the root of the project directory.  
Test coverage is 100%, with no styling offense.

```
$ rspec / # To run the tests (include test coverage)
$ rubocop / # To inspect the syntax
```

You can interact with this project in your favourite REPL, like Pry, as follows:   

```
[1] pry(main)> require './lib/operation'
=> true
[2] pry(main)> operation = Operation.new
=> #<Operation:0x00007fc90c0caa80 @account=[], @balance=0.0, @date="10/10/2018", @printer=#<Printer:0x00007fc90c0ca7d8 @header="Date || Credit || Debit || Balance", @statement=[]>>
[3] pry(main)> operation.deposit(300)
=> [{:date=>"10/10/2018", :credit=>300, :debit=>"", :balance=>300.0}]
[4] pry(main)> operation.withdraw(50)
=> [{:date=>"10/10/2018", :credit=>300, :debit=>"", :balance=>300.0}, {:date=>"10/10/2018", :credit=>"", :debit=>50, :balance=>250.0}]
[5] pry(main)> operation.bank_statement
Date || Credit || Debit || Balance
10/10/2018 ||  || 50 || 250.0
10/10/2018 || 300 ||  || 300.0
=> nil
[6] pry(main)> operation.withdraw(300)
RuntimeError: Cannot withdraw: Insufficient funds!
```

## Approach

I started to list the acceptance criteria and draw a diagram to get an idea of the domain model and the interactions the user will have.  
I finally used two different classes - Operation and Printer - as they don't have the same responsabilities. Operation is in charge of adding transactions (deposit and withdraw) and Printer allows the user to print a bank statement with columns and rows.  
Moreover, I choose to integrate Travis CI to make sure the codebase could be used without breaking in a clean environment.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```