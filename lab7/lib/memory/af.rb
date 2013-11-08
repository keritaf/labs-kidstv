require_relative 'base'

module Memory
  class Af < Base
    def initialize(size)
      super(size)
      @bad = Set.new(Array.new(number_bad_cells) { rand(size - 1) })
    end

    def [](i)
      return nil if @bad.include?(i)
      @memory[i]
    end
  end
end
