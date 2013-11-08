Dir[File.expand_path('../lib/**/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'
require 'colorize'

# 9

MBit = 1024 * 1024
SIZE = 8 * 8 #* MBit

mem = Memory::Anpsf.new(SIZE, 9)

binding.pry


