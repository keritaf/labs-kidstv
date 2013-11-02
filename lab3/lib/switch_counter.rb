class SwitchCounter

  def initialize(tests)
    @tests = tests
    @scheme = Scheme.new
  end

  def count
    binding.pry
    states[0...-1].zip(states[1..-1]).map{|first, last| switches(first, last)}.inject(:+)
  end

  def states
    @tests.each_with_object([]) do |test, arr|
      @scheme.signals = test
      arr << @scheme.state
    end
  end

  def switches(first, last)
    count = 0

    first.each_with_index do |v, i|
      count += 1 if v != last[i]
    end

    count
  end

end
