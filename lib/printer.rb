# frozen_string_literal: true

# Instances of this class are STDOUT to console.
class Printer
  HEADER = 'date || credit || debit || balance'

  def print(transactions_array)
    print_header
    print_transactions(transactions_array)
  end

  private

  def print_header
    puts HEADER
  end

  def print_transactions(transactions_array); end
end
