require_relative 'base'

module Memory
  class Anpsf < Base

    def initialize(size, neighbors)
      super(size)
      @neighbors = neighbors - 1
      bad_cells = Array.new(number_bad_cells) { rand(size - 1) }
      @bad_hash = bad_cells.each_with_object({}) do |cell, hash|
        neighbors(cell).each { |neighbor| hash[neighbor] = cell }
      end
    end

    def []=(i, val)
      if base = @bad_hash[i]
        @memory[base] = inverse(@memory[base])
      end
      @memory[i] = val
    end

    protected

    def neighbors(cell)
      half = @neighbors/2
      [[*cell-half..cell-1], [*cell+1..cell+half]].flatten
    end

  end
end
