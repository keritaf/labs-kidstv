module Memory
  class Cfin
    def initialize(size)
      super
      @bad_hash = Hash[Array.new(size * rand(0.0..0.1)) { [rand(size-1), rand(size - 1)] }]
    end

    def []=(i, val)
      if victim = @bad_hash[i]
        @memory[victim] = inverse(@memory[victim])
      end
        @memory[i] = val
    end

  end
end
