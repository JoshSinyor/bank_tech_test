# frozen_string_literal: true

require 'printer'

describe Printer do
  subject(:printer) { described_class.new }

  let(:stdout_output) { capture_stdout { printer.print(TEST_ARRAY) } }
  let(:array_output) { stdout_output.split("\n") }
  let(:subarray_output) do
    array_output.map! { |x| x.split('||') }
    array_output.map! { |x| x.map!(&:strip) }
  end
  let(:random_subarray_output) { subarray_output[1..].sample }

  it { is_expected.to respond_to :print }

  describe '#print_header' do
    it 'on the first line' do
      expect(stdout_output).to start_with(Printer::HEADER)
    end

    it 'even if the #array is empty' do
      stdout_output = capture_stdout { printer.print([]) }
      expect(stdout_output).to start_with(Printer::HEADER)
    end
  end

  describe '#process_array' do
    it 'in descending date order' do
      subarray_output[1..-2].each_with_index do |x, i|
        expect(DateTime.parse(x[0]).jd).to be >= DateTime.parse(subarray_output[i + 2][0]).jd
      end
    end
  end

  describe '#add_balance' do
    it 'to each transaction' do
      subarray_output[1..].each do |x|
        expect(x[3]).to match(/[0-9]*.[0-9]{2}/)
      end
    end
  end

  describe '#print_array' do
    it 'to stdout' do
      expect(stdout_output).to eq TEST_ARRAY_OUTPUT
    end

    it 'starting on the second line' do
      expect(array_output[1]).to match(%r{[0-9]{2}/[0-9]{2}/[0-9]{4}( \|\|){1,2}( [0-9]*\.[0-9]{2})( \|\|){1,2}( [0-9]*\.[0-9]{2})})
    end
  end

  describe '#format_row' do
    it 'dates as DD/MM/YYYY' do
      expect(random_subarray_output[0]).to match(%r{[0-9]{2}/[0-9]{2}/[0-9]{4}})
    end

    it 'sums as #.##' do
      expect(/[0-9]*\.[0-9]{2}/).to match(random_subarray_output[1]).or match(random_subarray_output[2])
      expect(/[0-9]*\.[0-9]{2}/).to match(random_subarray_output[3])
    end
  end
end
