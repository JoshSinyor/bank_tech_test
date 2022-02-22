# frozen_string_literal: true

require 'printer'

describe Printer do
  subject(:printer) { described_class.new }

  let(:test_array) { TEST_ARRAY }
  let(:output) { capture_stdout { printer.print(test_array) } }

  it { is_expected.to respond_to :print }

  describe '#print_header' do
    it 'on the first line' do
      expect(output).to start_with(Printer::HEADER)
    end

    it 'even if the #array is empty' do
      output = capture_stdout { printer.print([]) }
      expect(output).to start_with(Printer::HEADER)
    end
  end

  describe '#process_array' do
    it 'in descending date order' do
      array = []
      output.split("\n").each { |x| array.push x[0, 10] }

      array[1..-2].each_with_index do |x, i|
        expect(DateTime.parse(x).jd).to be >= DateTime.parse(array[i + 2]).jd
      end
    end
  end

  describe '#print_array' do
    it 'starting on the second line' do
      expect(output.split("\n")[1]).to eq TEST_ARRAY_OUTPUT.split("\n")[1]
    end
  end
end
