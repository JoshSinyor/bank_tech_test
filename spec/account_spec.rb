# frozen_string_literal: true

require 'account'

describe Account do

  describe 'initialize' do
    it 'initializes with a transaction array' do
      expect(subject).to have_attributes(:transactions_array)
    end

    it 'initializes with an empty transaction array' do
      expect(subject.transactions_array).to be_empty
    end
  end

  it 'responds to #deposit' do
  end

  it 'responds to #withdraw' do
  end

  it 'responds to #print' do
  end
end
