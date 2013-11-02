Dir[File.expand_path('../lib/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'

tests = (0..2**Scheme::INPUTS-1).map{|i| ("%0#{Scheme::INPUTS}d" % i.to_s(2)).each_char.map(&:to_i)}

tests.each_with_object(0) do |test|

  puts "#{test.inspect} => #{FaultHunter.new(test).faults.inspect}"

  # puts "#{test.inspect} => #{scheme.process(test)}"


  # if Object.const_get(node).value == value.to_i && F6.value == value.to_i
  #   puts "#{test.inspect}"
  # end
end

