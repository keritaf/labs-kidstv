Dir[File.expand_path('../lib/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'
require 'colorize'

lsrf = Lsrf.new

states = []

1.upto(2**Scheme::INPUTS-1) do
  states << lsrf.state.dup
  lsrf.next
end

stats = states.map do |init_state|
  lsrf = Lsrf.new(init_state)
  cover = Cover.new

  until cover.full?
    faults = FaultHunter.new(lsrf.state).faults
    cover.merge(faults)
    lsrf.next
  end

  puts "#{init_state.inspect} => #{lsrf.cycle}"

  [lsrf.cycle, init_state]
end

min = stats.map{|cycle,_| cycle }.min
puts "Minimum states (#{min})"

stats.select{|cycle, _| cycle == min}.each { |_, state| puts state.inspect }
