# frozen_string_literal: true

require_relative 'transactions'
require_relative 'printer'

# Instances of this class are accounts.
class Account
  attr_reader :transactions, :printer

  def initialize
    @transactions = Transactions.new
    @printer = Printer.new
  end

  def deposit(sum, date)
    @transactions.add(date, sum)
  end

  def withdraw(sum, date)
    @transactions.add(date, -sum)
  end

  def print_statement
    @printer.print(@transactions.array)
  end
end
