Dir[File.expand_path('../lib/**/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'
require 'colorize'

# 9
# GALPAT March A March PS

MBit = 1024 * 1024
SIZE = 8 * 1024

mem  = Memory::Base.new(SIZE)
af   = Memory::Af.new(SIZE)
saf  = Memory::Saf.new(SIZE)
cfid = Memory::Cfid.new(SIZE)
cfin = Memory::Cfin.new(SIZE)

[mem, af, saf, cfid, cfin].each do |memory|
  galpat = Tests::Galpat.new(memory, SIZE)
  galpat.perform

  puts "#{galpat.errors.inspect}[#{galpat.errors.count}] <=> #{memory.bad.inspect}[#{memory.bad.count}]"
end

