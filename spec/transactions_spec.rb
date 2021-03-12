# frozen_string_literal: true
# # frozen_string_literal: true
#
# require 'transactions'
#
# describe Transactions do
#   subject(:transactions) { described_class.new }
#
#   it { is_expected.to respond_to :balance }
#   it { is_expected.to respond_to :array }
#
#   describe '#initialize' do
#     it 'with a #balance of 0' do
#       expect(transactions.balance).to eq 0
#     end
#
#     it 'with an empty #transactions_array' do
#       expect(transactions.array).to be_empty
#     end
#   end
#
#   describe '#add' do
#     it 'to the #transactions.array' do
#       transactions.add(RANDOM_SUM, RANDOM_DATE)
#       expect(account.transactions.array).not_to be_empty
#     end
#
#     it 'with the supplied date' do
#       account.deposit(RANDOM_SUM, RANDOM_DATE)
#       expect(account.transactions.array.first[:date]).to eq RANDOM_DATE
#     end
#
#     it 'with the supplied sum' do
#       account.deposit(RANDOM_SUM, RANDOM_DATE)
#       expect(account.transactions.array.first[:credit]).to eq RANDOM_SUM
#     end
#   end
# end
