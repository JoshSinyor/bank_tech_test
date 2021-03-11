# frozen_string_literal: true

require_relative 'transaction'
require_relative 'printer'

# Instances of this class are accounts.
class Account
  attr_reader :transactions_array, :printer

  def initialize
    @transactions_array = []
    @printer = Printer.new
  end

  def deposit(sum, date)
    @transactions_array.push(Transaction.new(sum, date))
  end

  def withdraw(sum, date)
    @transactions_array.push(Transaction.new(-sum, date))
  end

  def print
    @printer.print(@transactions_array)
  end
end
