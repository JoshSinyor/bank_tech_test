# frozen_string_literal: true

require 'printer'

describe Printer do
  subject(:printer) { described_class.new }

  let(:test_array) { TEST_ARRAY }

  it { is_expected.to respond_to :print }

  describe '#print_header' do
    it 'on the first line' do
      output = capture_stdout { printer.print(test_array) }
      expect(output).to start_with(Printer::HEADER)
    end

    it 'even if the #array is empty' do
      output = capture_stdout { printer.print([]) }
      expect(output).to start_with(Printer::HEADER)
    end
  end

  describe '#print_transactions' do
    it 'starting on the second line' do
      output = capture_stdout { printer.print(test_array) }
      expect(output.split("\n")[1]).to include(TEST_ARRAY_OUTPUT)
    end
  end
end
