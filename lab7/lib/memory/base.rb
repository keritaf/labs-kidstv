module Memory
  class Base
    attr_reader :bad

    def initialize(size)
      @size = size
      @memory = Array.new(size) { rand(0..1) }
      @bad = Set.new([])
    end

    def [](i)
      @memory[i]
    end

    def []=(i, val)
      @memory[i] = val
    end

    def number_bad_cells
      return @number_bad_cells if @number_bad_cells
      number = (@size * rand(0.0..0.1)).to_i
      @number_bad_cells = number == 0 ? 1 : number
    end

    protected

    def inverse(val)
      val == 0 ? 1 : 0
    end

  end
end
