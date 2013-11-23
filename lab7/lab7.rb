Dir[File.expand_path('../lib/**/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'
require 'colorize'

# 9
# GALPAT March A March PS

MBit = 1024 * 1024
SIZE = 8 * 256

mems = []

mems << Memory::Base.new(SIZE)
mems << Memory::Af.new(SIZE)
mems << Memory::Saf.new(SIZE)
mems << Memory::Cfid.new(SIZE)
mems << Memory::Cfin.new(SIZE)
mems << Memory::Anpsf.new(SIZE, 5)
mems << Memory::Pnpsf.new(SIZE, 9)

tests = [Tests::Galpat, Tests::MarchA, Tests::MarchPs]

tests.each do |test_class|
  StatsPrinter.print_header(test_class)
  mems.each do |memory|
    test = test_class.new(memory, SIZE)
    test.perform
    StatsPrinter.new(memory.name, memory.bad, test.errors).print
  end
end
