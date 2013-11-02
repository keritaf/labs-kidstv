Dir[File.expand_path('../lib/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'
require 'colorize'

tests = (0..2**Scheme::INPUTS-1).map{|i| ("%0#{Scheme::INPUTS}d" % i.to_s(2)).each_char.map(&:to_i)}

faults = tests.each_with_object({}) { |test, h| h[test] = FaultHunter.new(test).faults }

FaultPrinter.new(faults).print($stdout)

min_tests = FaultMinFinder.new(faults).perform

puts "\nMinimum tests:".cyan
puts min_tests.map(&:inspect).join("\n")
puts "Number of switches: ".red + "#{SwitchCounter.new(min_tests).count}"

optional = SwitchAnalyzer.new(min_tests).analyze
puts "\nOptinal flow:".cyan
puts optional[:tests].map(&:inspect).join("\n")
puts "Number of switches: ".red + "#{optional[:switches]}"
