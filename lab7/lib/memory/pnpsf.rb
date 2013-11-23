require_relative 'base'

module Memory
  class Pnpsf < Base

    def initialize(size, neighbors)
      super(size)
      @neighbors = neighbors - 1
      @bad = Set.new(Array.new(number_bad_cells) { rand(size-1) })
      @bad_hash = Hash[@bad.map { |cell| [cell, Array.new(@neighbors) {rand(0..1)}] }]
    end

    def []=(i, val)
      if value = @bad_hash[i]
        return if value == neighbors_values_for(i)
      end
      @memory[i] = val
    end

    protected

    def neighbors_values_for(cell)
      # -4 -3 -2 -1 1 2 3 4
      #  0  1  2  3 4 5 6 7
       value = Array.new(@neighbors)

       1.upto(@neighbors / 2) do |i|
         value[@neighbors / 2 + i - 1] = @memory[cell + i]
         value[@neighbors / 2 - i] = @memory[cell - i]
       end

       value
    end

  end
end
