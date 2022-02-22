# frozen_string_literal: true

RANDOM_SUM = rand(999)

RANDOM_DATE = Time.at(rand * Time.now.to_i).strftime('%d-%m-%Y')

RANDOM_DATE_OBJECT = DateTime.new(RANDOM_DATE.split('-')[2].to_i,
                                  RANDOM_DATE.split('-')[1].to_i,
                                  RANDOM_DATE.split('-')[0].to_i)

RANDOM_DATE_OUTPUT = RANDOM_DATE_OBJECT.strftime('%d/%m/%Y')

TEST_ARRAY = [{ date: DateTime.jd(2455937), sum: 1000 },
              { date: DateTime.jd(2455941), sum: -500 },
              { date: DateTime.jd(2455940), sum: 2000 }].freeze

TEST_ARRAY_OUTPUT =
  <<~HEREDOC
    date || credit || debit || balance
    14/01/2012 || || 500.00 || 2500.00
    13/01/2012 || 2000.00 || || 3000.00
    10/01/2012 || 1000.00 || || 1000.00
  HEREDOC

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

def capture_stdout_pty(pty_input)
  primary, replica = PTY.open
  read, write = IO.pipe
  spawn('irb -r ./lib/account', in: read, out: replica)
  read.close
  replica.close

  pty_input.each { |input| write.puts input }
  write.close

  stdout_capture = ''

  loop do
    stdout_capture += "#{primary.gets.chomp}\n"
  rescue Errno::EIO, NoMethodError
    return stdout_capture
  end
end
