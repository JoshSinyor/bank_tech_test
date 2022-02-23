# frozen_string_literal: true

require 'date'

# Instances of this class are the account's transaction array.
class Transactions
  attr_reader :array

  def initialize
    @array = []
  end

  def add(date, sum)
    date = parse_date(date)
    @array << { date: date, sum: sum }
  end

  private

  def parse_date(date)
    date = date.split('-')
    DateTime.new(date[2].to_i, date[1].to_i, date[0].to_i)
  end
end
