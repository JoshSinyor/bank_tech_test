# frozen_string_literal: true

require 'pty'

describe 'Feature Test' do
  let(:criteria_input) do
    [
      'account = Account.new',
      "account.deposit(1000, '10-01-2012')",
      "account.withdraw(500, '14-01-2012')",
      "account.deposit(2000, '13-01-2012')",
      'account.print_statement'
    ].freeze
  end

  let(:criteria_output) do
    <<~HEREDOC
      date || credit || debit || balance
      14/01/2012 || || 500.00 || 2500.00
      13/01/2012 || 2000.00 || || 3000.00
      10/01/2012 || 1000.00 || || 1000.00
    HEREDOC
  end

  let(:stdout) { capture_stdout_pty(criteria_input) }

  it 'output matches criteria output' do
    expect(stdout).to end_with(criteria_output)
  end

  it 'output has echoes suppressed' do
    expect(stdout).not_to match(/:\w+=>/)
  end
end
