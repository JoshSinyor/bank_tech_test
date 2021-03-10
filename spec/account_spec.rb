# frozen_string_literal: true

require 'account'

describe Account do
  describe '#initialize' do
    it 'initializes with a transaction array' do
      expect(described_class.new).to respond_to(:transactions_array)
    end

    it 'initializes with an empty transaction array' do
      expect(described_class.new.transactions_array).to be_empty
    end
  end

  describe '#deposit' do
    it 'responds to #deposit' do
      expect(described_class.new).to respond_to(:deposit)
    end
  end

  describe '#withdraw' do
    it 'responds to #withdraw' do
      expect(described_class.new).to respond_to(:withdraw)
    end
  end

  describe '#print' do
    it 'responds to #print' do
      expect(described_class.new).to respond_to(:print)
    end
  end
end
