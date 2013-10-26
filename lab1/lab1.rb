Dir[File.expand_path('../lib/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'

INPUTS = 7

$in = []

F3 = Function.new('or',  0, Not.new(1))
F1 = Function.new('not', 2)
F2 = Function.new('and', 4, 5)
F4 = Function.new('and', 3, F2, 6)
F5 = Function.new('or',  F1, F4)
F6 = Function.new('and', Not.new(F3), F5)

node   = ask("Node(F1-F6): ") { |n| n.default = "F4" }
value  = ask("Value(0|1): ")  { |val| val.default = "0" }

tests = (0..2**INPUTS-1).map{|i| ("%0#{INPUTS}d" % i.to_s(2)).each_char.map(&:to_i)}
r = tests.each_with_object([]) do |test, result|
  $in = test
  if Object.const_get(node).value == value.to_i
    result << test
    puts "#{test.inspect} => #{Object.const_get(node).value}"
  end
end

puts "Total: #{r.count} tests"
