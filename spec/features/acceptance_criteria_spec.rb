# frozen_string_literal: true

# require 'pty'
#
# ACCEPTANCE_CRITERIA_INPUT = [
#   'account = Account.new',
#   "account.deposit(1000, '10-01-2012')",
#   "account.deposit(2000, '13-01-2012')",
#   "account.withdraw(500, '14-01-2012')",
#   'account.print_statement'
# ].freeze
#
# ACCEPTANCE_CRITERIA_OUTPUT = <<~HEREDOC
#   date || credit || debit || balance
#   14/01/2012 || || 500.00 || 2500.00
#   13/01/2012 || 2000.00 || || 3000.00
#   10/01/2012 || 1000.00 || || 1000.00
# HEREDOC
#
# describe 'Feature Test' do
#   it 'meets acceptance criteria' do
#     primary, replica = PTY.open
#     read, write = IO.pipe
#     spawn('irb -r ./lib/account', in: read, out: replica)
#     read.close
#     replica.close
#
#     write.puts 'irb_context.echo = false'
#     ACCEPTANCE_CRITERIA_INPUT.each { |input| write.puts input }
#     write.close
#
#     output = ''
#
#     loop do
#       output += "#{primary.gets.chomp}\n"
#     rescue NoMethodError
#       break
#     end
#
#     expect(output).to end_with(ACCEPTANCE_CRITERIA_OUTPUT)
#   end
# end
