# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { described_class.new }

  it { is_expected.to respond_to :balance }
  it { is_expected.to respond_to :transactions_array }
  it { is_expected.to respond_to :printer }
  it { is_expected.to respond_to :deposit }
  it { is_expected.to respond_to :withdraw }
  it { is_expected.to respond_to :print_statement }

  describe '#initialize' do
    it 'with a #balance of 0' do
      expect(account.balance).to eq 0
    end

    it 'with an empty #transactions_array' do
      expect(account.transactions_array).to be_empty
    end
  end

  describe '#deposit' do
    it 'to the #transactions_array' do
      account.deposit(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions_array).not_to be_empty
    end

    it 'with the supplied date' do
      account.deposit(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions_array.first[:date]).to eq RANDOM_DATE
    end

    it 'with the supplied sum' do
      account.deposit(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions_array.first[:credit]).to eq RANDOM_SUM
    end
  end

  describe '#withdraw' do
    it 'from the #transactions_array' do
      account.withdraw(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions_array).not_to be_empty
    end

    it 'with the supplied date' do
      account.withdraw(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions_array.first[:date]).to eq RANDOM_DATE
    end

    it 'with the supplied sum' do
      account.withdraw(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions_array.first[:debit]).to eq RANDOM_SUM
    end
  end

  describe '#print_statement' do
    it 'sends the #transactions_array' do
      # This needs mocking to check that the correct output is being sent.

      account.deposit(RANDOM_SUM, RANDOM_DATE)
      output = capture_stdout { account.print_statement }
      expect(output).to start_with(Printer::HEADER)
    end
  end
end
