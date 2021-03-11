# frozen_string_literal: true

require 'printer'

describe Printer do
  subject(:printer) { described_class.new }
  let(:array) { :array }

  describe '#print' do
    it 'a header on the first line' do
      output = capture_stdout { printer.print(:array) }
      expect(output).to start_with(Printer::HEADER)
    end
  end
end
