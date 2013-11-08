module Memory
  class Af
    def initialize(size)
      super
      @bad = Array.new(size * rand(0.0..0.1)) { rand(size - 1) }
    end

    def [](i)
      return nil if @bad.include?(i)
      @memory[i]
    end
  end
end
