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

```
$ rspec
```

You can interact with this project in your favourite REPL, like Pry, as follows:   

```
[1] pry(main)> require './lib/operation'
=> true
[2] pry(main)> o = Operation.new
=> #<Operation:0x00007f8c6c2cb460 @account=[], @balance=0.0, @date="09/10/2018", @printer=#<Printer:0x00007f8c6c2cb3c0 @header="Date || Credit || Debit || Balance", @statement=[]>>
[3] pry(main)> o.deposit(400)
=> [{:date=>"09/10/2018", :credit=>400, :debit=>"", :balance=>400.0}]
[4] pry(main)> o.withdraw(20)
=> [{:date=>"09/10/2018", :credit=>400, :debit=>"", :balance=>400.0}, {:date=>"09/10/2018", :credit=>"", :debit=>20, :balance=>380.0}]
[5] pry(main)> o.printer.print_statement(o.account)
Date || Credit || Debit || Balance
09/10/2018 ||  || 20 || 380.0
09/10/2018 || 400 ||  || 400.0
```