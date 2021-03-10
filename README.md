# Bank Tech Test

This repository reflects Makers Academy Week 10 project [Bank Tech Test](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md). The general overview of this challenge is to create a bank account manager.

---

## Table of Contents

- [Specification](#specification)
  * [Requirements](#requirements)
  * [Acceptance Criteria](#acceptance-criteria)
- [Getting Started](#getting-started)
  * [Prerequisite(s)](#prerequisite-s-)
  * [Installation](#installation)
- [Running the Program](#running-the-program)
  * [Making a Deposit](#making-a-deposit)
  * [Making a Withdrawal](#making-a-withdrawal)
  * [Printing a Statement](#printing-a-statement)
- [Development Process](#development-process)
  * [Modelling](#modelling)
  * [Test-Driven Design](#test-driven-design)
  * [Behaviour-Driven Design](#behaviour-driven-design)
- [Testing](#testing)
- [Built With](#built-with)
- [Author(s)](#author-s-)
- [License(s)](#license-s-)
- [Acknowledgements](#acknowledgements)

---

## Specification

The specification of this tech test is as follows:

### Requirements

[ ] 1. You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
[ ] 2. Deposits, withdrawal.
[ ] 3. Account statement (date, amount, balance) printing.
[ ] 4. Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance Criteria

Given a client makes a deposit of 1000 on 10-01-2012, and
A deposit of 2000 on 13-01-2012, and
A withdrawal of 500 on 14-01-2012;
When she prints her bank statement,
Then she would see:

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

---

## Getting Started

### Prerequisite(s)

This project requires Ruby 3.0.0. If you do not have Ruby 3.0.0, install it using [these instructions](https://www.ruby-lang.org/en/documentation/installation/).

### Installation

1. [Clone](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository) or [fork](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo) this repository.
2. Install the necessary Gems from the `Gemfile` by executing `bundle install`.
3. Confirm successful installation by executing `rspec /spec/install_spec`. If the program and its dependencies have been successfully installed, "`Program successfully installed.`" will be printed to console.

---

## Running the Program

1. Move your working directory to the project directory (`/bank_tech_test`).
2. Start the program by executing `ruby lib/bank_tech_test.rb`.
3. Create a new account by executing `account = Account.new`.

### Making a Deposit

Deposit funds to the account by executing `account.deposit(sum, date)`, where the `sum` parameter is a non-optional integer, and the `date` parameter is an optional argument. If no `date` argument is supplied, a default value of the current date and time (`DateTime.now`) will be appended to the deposit. To supply a `date` argument, use integers for day, month and year in the format `dd-mm-yyyy`.

A deposit can be assigned to any date; the manager will insert it into the account history in chronological order.

### Making a Withdrawal

Withdraw funds from the account by executing `account.withdraw(sum, date)`, where the `sum` parameter is a non-optional integer, and the `date` parameter is an optional argument. If no `date` argument is supplied, a default value of the current date and time (`DateTime.now`) will be appended to the withdrawal. To supply a `date` argument, use integers for day, month and year in the format `dd-mm-yyyy`.

A withdrawal can be assigned to any date; the manager will attempt to insert it into the account history in chronological order. However, the withdrawal will be rejected (returning error code `Insufficient funds!`) unless sufficient funds to cover the withdrawal are available at the time the withdrawal is made.

### Printing a Statement

Print an account statement to console by executing `account.print_statement`.

---

## Development Process

### Modelling

### Test-Driven Design

### Behaviour-Driven Design

---

## Testing

---

## Built With

---

## Author(s)

---

## License(s)

---

## Acknowledgements

- Table of contents generated with [markdown-toc](http://ecotrust-canada.github.io/markdown-toc/).
