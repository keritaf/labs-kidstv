Dir[File.expand_path('../lib/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'
require 'colorize'

POLYNOM_MAX = 10

lsrf, states = Lsrf.new, []

1.upto(2**Scheme::INPUTS-1) do
  states << lsrf.state.dup
  lsrf.next
end

polynoms = [*0..2**POLYNOM_MAX-1].map{|i| i.to_s(2).each_char.to_a.map(&:to_i).reverse }.select{|p| p.first == 1}

polynoms.each do |polynom|
  analyzer = Analyzer.new(polynom)
  coverage = CoverageCounter.new(states, analyzer).count
  puts "#{polynom.inspect} => #{coverage}"
end
