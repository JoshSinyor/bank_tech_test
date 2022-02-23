# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { described_class.new }

  it { is_expected.to respond_to :deposit }
  it { is_expected.to respond_to :withdraw }
  it { is_expected.to respond_to :print_statement }

  describe '#deposit' do
    it 'to the #transactions.array' do
      account.deposit(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions.array).not_to be_empty
    end

    it 'with the supplied date' do
      account.deposit(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions.array.first[:date]).to eq RANDOM_DATE_OBJECT
    end

    it 'with the supplied sum' do
      account.deposit(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions.array.first[:sum]).to eq RANDOM_SUM
    end
  end

  describe '#withdraw' do
    it 'from the #transactions.array' do
      account.withdraw(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions.array).not_to be_empty
    end

    it 'with the supplied date' do
      account.withdraw(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions.array.first[:date]).to eq RANDOM_DATE_OBJECT
    end

    it 'with the supplied sum' do
      account.withdraw(RANDOM_SUM, RANDOM_DATE)
      expect(-account.transactions.array.first[:sum]).to eq RANDOM_SUM
    end
  end

  describe '#print_statement' do
    it 'sends the #transactions.array' do
      # This needs mocking to check that the correct output is being sent.

      account.deposit(RANDOM_SUM, RANDOM_DATE)
      output = capture_stdout { account.print_statement }
      expect(output).to start_with(Printer::HEADER)
    end
  end
end
