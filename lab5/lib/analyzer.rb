class Analyzer

  attr_reader :complexity

  def initialize(polynomial)
    @polynomial = polynomial
    @indexes = polynomial.map.with_index{|v,i| v == 1 ? i : nil}.reject{|i| i.nil? || i == 0}.map{|i| i - 1}
    @complexity = @indexes.size + 1
    reset
  end

  def shift(value)
    i = @indexes.inject(value) {|input, index| input ^ @state[index]}
    @state.unshift(i)
    @state.pop
  end

  def state
    @state.dup
  end

  def reset
    @state = Array.new(@polynomial.size - 1) { 0 }
  end

end
