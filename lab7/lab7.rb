Dir[File.expand_path('../lib/**/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'
require 'colorize'

# 9
# GALPAT March A March PS

Mbit = 1024 * 1024
SIZE = 8 * 1024
ANSPF = 5
PNPSF = 9

mems = []

mems << Memory::Base.new(SIZE)
mems << Memory::Af.new(SIZE)
mems << Memory::Saf.new(SIZE)
1.upto(ANSPF-1) { |i| mems << Memory::Anpsf.new(SIZE, ANSPF, i) }
mems << Memory::Pnpsf.new(SIZE, PNPSF)

Memory::Cfin::ADDRESS.each do |addr|
  Memory::Cfin::DIRECTION.each do |dir|
    mems << Memory::Cfin.new(SIZE, addr, dir)
    Memory::Cfid::VALUES.each do |val|
      mems << Memory::Cfid.new(SIZE, addr, dir, val)
    end
  end
end

tests = [Tests::MarchA, Tests::MarchPs, Tests::Galpat]

tests.each do |test_class|
  StatsPrinter.print_header(test_class)
  mems.each do |memory|
    test = test_class.new(memory, SIZE)
    test.perform
    StatsPrinter.new(memory.name, memory.bad, test.errors).print
  end
end
