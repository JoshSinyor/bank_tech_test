# frozen_string_literal: true

# Instances of this class are STDOUT to console.
class Printer
  HEADER = 'date || credit || debit || balance'

  def print(array)
    print_header
    print_transactions(array) unless array.empty?
  end

  private

  def print_header
    puts HEADER
  end

  def print_transactions(array)
    array.each do |row|
      format_row(row)
      puts "#{row[:date]} || #{row[:credit]}|| #{row[:debit]}|| #{row[:balance]}"
    end
  end

  def format_row(row)
    row[:date] = row[:date].strftime('%d/%m/%Y')
    row[:credit] = format('%.02f ', row[:credit]) if row[:credit]
    row[:debit] = format('%.02f ', row[:debit]) if row[:debit]
    row[:balance] = format('%.02f', row[:balance])
  end
end
