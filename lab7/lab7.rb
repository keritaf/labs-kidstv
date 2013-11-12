require 'require_all'
require_all 'lib'
require 'pry'
require 'highline/import'
require 'colorize'

# 9
# GALPAT March A March PS

MBit = 1024 * 1024
SIZE = 8 * 8

mem  = Memory::Base.new(SIZE)
af   = Memory::Af.new(SIZE)
saf  = Memory::Saf.new(SIZE)
cfid = Memory::Cfid.new(SIZE)
cfin = Memory::Cfin.new(SIZE)

puts "Galpat".cyan
[mem, af, saf, cfid, cfin].each do |memory|
  galpat = Tests::Galpat.new(memory, SIZE)
  galpat.perform

  puts "#{galpat.errors.inspect}[#{galpat.errors.count}] <=> #{memory.bad.inspect}[#{memory.bad.count}]"
end

puts "March A".cyan
[mem, af, saf, cfid, cfin].each do |memory|
  march = Tests::MarchA.new(memory, SIZE)
  march.perform

  puts "#{march.errors.inspect}[#{march.errors.count}] <=> #{memory.bad.inspect}[#{memory.bad.count}]"
end

puts "March PS".cyan
[mem, af, saf, cfid, cfin].each do |memory|
  march = Tests::MarchA.new(memory, SIZE)
  march.perform

  puts "#{march.errors.inspect}[#{march.errors.count}] <=> #{memory.bad.inspect}[#{memory.bad.count}]"
end

