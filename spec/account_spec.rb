# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:transaction) { }

  it { is_expected.to respond_to :transactions_array }
  it { is_expected.to respond_to :deposit }
  it { is_expected.to respond_to :withdraw }
  it { is_expected.to respond_to :print }

  describe '#initialize' do
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
      expect(account.transactions_array.first.date).to eq RANDOM_DATE
    end

    it 'with the supplied sum' do
      account.deposit(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions_array.first.sum).to eq RANDOM_SUM
    end

    it 'a positive sum' do
      account.deposit(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions_array.first.sum).to be_positive
    end
  end

  describe '#withdraw' do
    it 'from the #transactions_array' do
      account.withdraw(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions_array).not_to be_empty
    end

    it 'with the supplied date' do
      account.withdraw(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions_array.first.date).to eq RANDOM_DATE
    end

    it 'with the supplied sum' do
      account.withdraw(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions_array.first.sum).to eq -RANDOM_SUM
    end

    it 'a negative sum' do
      account.withdraw(RANDOM_SUM, RANDOM_DATE)
      expect(account.transactions_array.first.sum).to be_negative
    end
  end

  # describe '#print' do
  # end
end
