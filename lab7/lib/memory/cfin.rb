require_relative 'base'

module Memory
  class Cfin < Base
    ADDRESS = %w(gt lt)
    DIRECTION = %w(up down)

    def initialize(size, addr, direction)
      super(size)
      @addr, @direction = addr, direction
      @bad = Set.new(Array.new(number_bad_cells) { rand(size-1) })
      bad_arr = @bad.map do |cell|
        victim = if @addr == "gt"
                  rand(cell+1..size-1)
                else
                  rand(0...cell)
                end
        [cell, victim]
      end
      @bad_hash = Hash[bad_arr]
    end

    def []=(i, new_value)
      value = @memory[i]
      initial, final = @direction == "up" ? [0, 1] : [1, 0]
      if value == initial && new_value == final && victim = @bad_hash[i]
        @memory[victim] = inverse(@memory[victim])
      else
        @memory[i] = new_value
      end
    end

    def name
      "#{self.class.name} #{@addr}<#{@direction},aj >"
    end

    def bad
      Set.new(@bad_hash.to_a.flatten)
    end

  end
end
