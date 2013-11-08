require_relative 'base'

module Memory
  class Saf < Base
    def initialize(size)
      super(size)
      @bad = Set.new(Array.new(number_bad_cells) { rand(size - 1) })
    end

    def [](i)
      return 0 if @bad.include?(i)
      @memory[i]
    end

  end
end
