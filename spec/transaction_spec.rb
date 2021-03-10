# frozen_string_literal: true

require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(RANDOM_SUM, RANDOM_DATE) }

  it { is_expected.to respond_to :date }
  it { is_expected.to respond_to :sum }

  describe 'initialize' do
    it 'with the supplied date' do
      expect(transaction.date).to eq RANDOM_DATE
    end

    it 'with the supplied sum' do
      expect(transaction.sum).to eq RANDOM_SUM
    end
  end
end
