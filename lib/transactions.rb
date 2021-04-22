# frozen_string_literal: true

require 'date'

# Instances of this class are the account's transaction array.
class Transactions
  attr_reader :balance, :array

  def initialize
    @balance = 0
    @array = []
  end

  def add(date, sum)
    date = parse_date(date)
    update_balance(sum)
    @array.unshift({ date: date,
                     sum: sum,
                     balance: @balance })
  end

  private

  def update_balance(sum)
    @balance += sum
  end

  def parse_date(date)
    date = date.split('-')
    DateTime.new(date[2].to_i, date[1].to_i, date[0].to_i)
  end
end
