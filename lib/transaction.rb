# frozen_string_literal: true

# Instances of this class are transactions.
class Transaction
  attr_reader :date, :sum

  def initialize(sum, date)
    @date = date
    @sum = sum
  end
end
