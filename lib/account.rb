# frozen_string_literal: true

require_relative 'printer'

# Instances of this class are accounts.
class Account
  attr_reader :balance, :transactions_array, :printer

  def initialize
    @balance = 0
    @transactions_array = []
    @printer = Printer.new
  end

  def deposit(sum, date)
    @balance += sum
    @transactions_array.unshift({ date: date,
                                  credit: sum,
                                  debit: nil,
                                  balance: @balance })
  end

  def withdraw(sum, date)
    @balance -= sum
    @transactions_array.unshift({ date: date,
                                  credit: nil,
                                  debit: sum,
                                  balance: @balance })
  end

  def print_statement
    @printer.print(@transactions_array)
  end
end
