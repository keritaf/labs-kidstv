Dir[File.expand_path('../lib/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'
require 'colorize'
require 'matrix'

SEED = 42
STATES_NUMBER = 256
L = 40
POLYNOM = [1,0,0,0,1,1,0,1]

# polynom = X8+Х6+Х5+Х+1
# l = 40

random = Random.new(SEED)
polynom = Polynom.new([1,POLYNOM].flatten)
data = ("%0#{L}d" % random.rand(0...2**L).to_s(2)).each_char.to_a.map(&:to_i)

analyzer = Analyzer.new(polynom)
coverage = CoverageCounter.new(data, analyzer).count

puts "=".red * 50
puts "Single analyzer".center(50).red
puts "=".red * 50

coverage.each do |number_errors, hash|
  puts "=".cyan * 50
  puts "Number of errors: #{number_errors}".cyan
  puts "Coverage: #{hash[:coverage]}".cyan
  puts "=".cyan * 50
  puts "Wrong errors:" unless hash[:errors].empty?
  hash[:errors].each { |error| puts error.inspect }
end

analyzer = DoubleAnalyzer.new(polynom)
coverage = DoubleCoverageCounter.new(data, analyzer).count

puts "=".red * 50
puts "Double analyzer".center(50).red
puts "=".red * 50

coverage.each do |number_errors, hash|
  puts "=".cyan * 50
  puts "Number of errors: #{number_errors}".cyan
  puts "Coverage: #{hash[:coverage]}".cyan
  puts "=".cyan * 50
  puts "Wrong errors:" unless hash[:errors].empty?
  hash[:errors].each { |error| puts error.inspect }
end
