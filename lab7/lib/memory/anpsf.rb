require_relative 'base'

module Memory
  class Anpsf < Base

    def initialize(size, neighbors, position)
      super(size)
      @neighbors = neighbors - 1
      @position = position-1
      @bad = Set.new(Array.new(number_bad_cells) { rand(size - 1) })
      @bad_hash = @bad.each_with_object({}) do |cell, hash|
        hash[neighbor(cell, position)] = cell
      end
    end

    def []=(i, val)
      if base = @bad_hash[i]
        @memory[base] = inverse(@memory[base])
      end
      @memory[i] = val
    end

    def name
      "#{self.class.name}#{@neighbors+1}<#{@position}>"
    end

    protected

    def neighbor(cell, position)
      half = @neighbors/2
      [[*cell-half..cell-1], [*cell+1..cell+half]].flatten[@position]
    end

  end
end
