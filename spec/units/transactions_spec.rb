# frozen_string_literal: true

require 'transactions'

describe Transactions do
  subject(:transactions) { described_class.new }

  it { is_expected.to respond_to :array }

  describe '#initialize' do
    it 'with an empty #transactions_array' do
      expect(transactions.array).to be_empty
    end
  end

  describe '#add' do
    it 'to the #transactions.array' do
      transactions.add(RANDOM_DATE, RANDOM_SUM)
      expect(transactions.array).not_to be_empty
    end

    it 'with the supplied date' do
      transactions.add(RANDOM_DATE, RANDOM_SUM)
      expect(transactions.array.first[:date]).to eq RANDOM_DATE_OBJECT
    end

    it 'with the supplied sum' do
      transactions.add(RANDOM_DATE, RANDOM_SUM)
      expect(transactions.array.first[:sum]).to eq RANDOM_SUM
    end
  end
end
