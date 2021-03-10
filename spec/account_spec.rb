# frozen_string_literal: true

require 'account'

describe Account do
  it { is_expected.to respond_to :transactions_array }
  it { is_expected.to respond_to :deposit }
  it { is_expected.to respond_to :withdraw }
  it { is_expected.to respond_to :print }

  describe '#initialize' do
    it 'with an empty transaction array' do
      expect(described_class.new.transactions_array).to be_empty
    end
  end

  # describe '#deposit' do
  # end
  #
  # describe '#withdraw' do
  # end
  #
  # describe '#print' do
  # end
end
