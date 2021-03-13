require 'pty'

describe "Acceptance Criteria" do
  it "Feature Test" do
    master, slave = PTY.open
    read, write = IO.pipe
    pid = spawn("irb", :in=>read, :out=>slave)
    read.close
    slave.close

    write.puts "require './lib/account'"
    write.puts "account = Account.new"
    write.puts "account.deposit(1000, '10-01-2012')"
    write.puts "account.deposit(2000, '13-01-2012')"
    write.puts "account.withdraw(500, '14-01-2012')"
    write.puts "account.print_statement"
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    p master.gets.chomp
    write.close
  end
end
