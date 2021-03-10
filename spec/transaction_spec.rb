# frozen_string_literal: true

require 'transaction'

describe Transaction do
  describe '#initialize' do
    it 'initializes with a sum' do
      expect(described_class.new).to respond_to(:sum)
    end

    it 'initializes with a date' do
      expect(described_class.new).to respond_to(:date)
    end
  end
end
