Dir[File.expand_path('../lib/*.rb', __FILE__)].each {|f| require f}
require 'pry'
require 'highline/import'
require 'colorize'

POLYNOM_MIN = 7
POLYNOM_MAX = 10

lsrf, states = Lsrf.new, []

1.upto(2**Scheme::INPUTS-1) do
  states << lsrf.state.dup
  lsrf.next
end

data = PolynomGenerator.new(*[POLYNOM_MIN...POLYNOM_MAX]).generate

complexity, result = 100, []

data.each do |power, polynoms|
  puts "=".cyan * 80
  puts "Power #{power}".center(80).cyan
  puts "=".cyan * 80

  polynoms.each do |polynom|
    analyzer = Analyzer.new(polynom)
    coverage = (CoverageCounter.new(states, analyzer).count * 100).round
    str = "#{polynom.to_s.center(60)} | #{coverage.to_s.center(4)} | #{analyzer.complexity}"
    if coverage == 100
      if analyzer.complexity < complexity
        complexity = analyzer.complexity
        result = [] << polynom
      elsif analyzer.complexity == complexity
        result  << polynom
      end
      str = str.green
    else
      str = str.red
    end

    puts str
  end
end

puts "=".cyan * 50
puts "Optimal polynoms with #{complexity} complexity".center(50).cyan
puts "=".cyan * 50

result.each { |polynom| puts "#{polynom.to_s}" }
