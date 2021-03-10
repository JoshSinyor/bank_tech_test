# frozen_string_literal: true

# Examples of this class are accounts.
class Account
  attr_reader :transactions_array

  def initialize
    @transactions_array = []
  end

  def deposit; end

  def withdraw; end

  def print; end
end
