Dir[File.expand_path('../lib/**/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'
require 'colorize'

MBit = 1024 * 1024
SIZE = 8 #* MBit

mem = Memory::Base.new(SIZE)
binding.pry


# 9
