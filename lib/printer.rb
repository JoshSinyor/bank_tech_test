# frozen_string_literal: true

# Instances of this class are STDOUT to console.
class Printer
  def print(array)
    print_header
    print_transactions(deep_copy(array)) unless array.empty?
  end

  private

  HEADER = 'date || credit || debit || balance'

  def print_header
    puts HEADER
  end

  def deep_copy(array)
    Marshal.load(Marshal.dump(array))
  end

  def print_transactions(array)
    array.map do |row|
      format_row(row)
      puts "#{row[:date]} || #{row[:credit]}|| #{row[:debit]}|| #{row[:balance]}"
    end
  end

  def format_row(row)
    row[:date] = row[:date].strftime('%d/%m/%Y')
    row[:credit] = format('%.02f ', row[:sum]) if row[:sum].positive?
    row[:debit] = format('%.02f ', -row[:sum]) if row[:sum].negative?
    row[:balance] = format('%.02f', row[:balance])
  end
end
