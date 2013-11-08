module Memory
  class Base
    def initialize(size)
      @memory = Array.new(size) { rand(0..1) }
    end

    def [](i)
      @memory[i]
    end

    def []=(i, val)
      @memory[i] = val
    end

    protected

    def inverse(val)
      val == 0 ? 1 : 0
    end

  end
end
