module Memory
  class Saf
    def initialize(size)
      super
      @bad = Array.new(size * rand(0.0..0.1)) { rand(size - 1) }
    end

    def [](i)
      return 0 if @bad.include?(i)
      @memory[i]
    end

  end
end
