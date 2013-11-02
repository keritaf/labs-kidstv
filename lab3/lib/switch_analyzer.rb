class SwitchAnalyzer

  def initialize(tests)
    @tests = tests
  end

  def analyze
    optional = {tests: [], switches: 10000}

    combinations.each do |tests|
      switches = SwitchCounter.new(tests).count
      optional = {tests: tests, switches: switches} if switches < optional[:switches]
    end

    optional
  end

  def combinations
    @tests.permutation
  end

end
