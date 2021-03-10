# frozen_string_literal: true

require 'printer'

describe Printer do
  it { is_expected.to respond_to :print_header }
  it { is_expected.to respond_to :print_array }

  describe '#print_header' do
    it 'on the first line' do
      expect(described_class.print_header).to eq HEADER
    end
  end
end
