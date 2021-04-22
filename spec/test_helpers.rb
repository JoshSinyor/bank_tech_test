# frozen_string_literal: true

require 'date'

RANDOM_SUM = rand(999)

###

RANDOM_DATE = Time.at(rand * Time.now.to_i).strftime('%d-%m-%Y')
RANDOM_DATE_OBJECT = DateTime.new(RANDOM_DATE.split('-')[2].to_i,
                                  RANDOM_DATE.split('-')[1].to_i,
                                  RANDOM_DATE.split('-')[0].to_i)
RANDOM_DATE_OUTPUT = RANDOM_DATE_OBJECT.strftime('%d/%m/%Y')

###

TEST_ARRAY = [{ date: RANDOM_DATE_OBJECT, sum: RANDOM_SUM, balance: RANDOM_SUM }].freeze
TEST_ARRAY_OUTPUT = "#{RANDOM_DATE_OUTPUT} || #{format('%.02f ', RANDOM_SUM)}|| || #{format('%.02f', RANDOM_SUM)}"

###

def capture_stdout
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end
