# frozen_string_literal: true

# Instances of this class are STDOUT to console.
class Printer
  def print(array)
    array = deep_copy(array)
    print_header
    process_array(array) unless array.empty?
    print_array(array) unless array.empty?
  end

  private

  HEADER = 'date || credit || debit || balance'

  def print_header
    puts HEADER
  end

  def deep_copy(array)
    Marshal.load(Marshal.dump(array))
  end

  def process_array(array)
    array.sort_by! { |x| x[:date] }
    add_balance(array, 0)
    array.sort_by! { |x| x[:date] }.reverse!
  end

  def add_balance(array, balance)
    array.map do |row|
      balance += row[:sum]
      row[:balance] = balance
    end
  end

  def print_array(array)
    array.map do |row|
      format_row(row)
      print_row(row)
    end
  end

  def format_row(row)
    row[:date] = row[:date].strftime('%d/%m/%Y')
    row[:sum].positive? ? row[:credit] = format('%.02f ', row[:sum]) : row[:debit] = format('%.02f ', -row[:sum])
    row[:balance] = format('%.02f', row[:balance])
  end

  def print_row(row)
    puts "#{row[:date]} || #{row[:credit]}|| #{row[:debit]}|| #{row[:balance]}"
  end
end
