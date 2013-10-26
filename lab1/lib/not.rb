class Not < Function

  def initialize(input)
    @input = input
  end

  def value
    result = @input.is_a?(Function) ? @input.value : $in[@input]
    result == 1 ? 0 : 1
  end

end
