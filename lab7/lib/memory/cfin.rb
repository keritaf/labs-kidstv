require_relative 'base'

module Memory
  class Cfin < Base
    def initialize(size)
      super(size)
      @bad_hash = Hash[Array.new(number_bad_cells) { [rand(size-1), rand(size - 1)] }]
    end

    def []=(i, val)
      if victim = @bad_hash[i]
        @memory[victim] = inverse(@memory[victim])
      end
        @memory[i] = val
    end

  end
end