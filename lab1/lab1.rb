Dir[File.expand_path('../lib/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'

INPUTS = 7

$in = []

F1 = Function.new('and', 0, 1)
F2 = Function.new('not', 2)
F3 = Function.new('or',  4, 5)
F4 = Function.new('and', 3, 6, F3)
F5 = Function.new('nor', F2, F4)
F6 = Function.new('and', F1, F5)

node   = ask("Node(F1-F6): ") { |n| n.default = "F4" }
value  = ask("Value(0|1): ")  { |val| val.default = "0" }

tests = (0..2**INPUTS-1).map{|i| ("%0#{INPUTS}d" % i.to_s(2)).each_char.map(&:to_i)}
count = 0

tests.each_with_object(0) do |test|
  $in = test
  if Object.const_get(node).value == value.to_i && F6.value == value.to_i
    puts "#{test.inspect}"
    count += 1
  end
end

puts "Total: #{count} tests"
