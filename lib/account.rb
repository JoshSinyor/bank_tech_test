# frozen_string_literal: true

require_relative 'transaction'

# Instances of this class are accounts.
class Account
  attr_reader :transactions_array

  def initialize
    @transactions_array = []
  end

  def deposit(sum, date)
    @transactions_array.push(Transaction.new(sum, date))
  end

  def withdraw(sum, date)
    sum = -sum
    @transactions_array.push(Transaction.new(sum, date))
  end

  def print; end
end
