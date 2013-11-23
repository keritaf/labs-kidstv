require_relative 'cfin'

module Memory
  class Cfid < Cfin
    VALUES = [0,1]

    def initialize(size, addr, direction, value)
      super(size, addr, direction)
      @value = value
    end

    def []=(i, new_value)
      value = @memory[i]
      initial, final = @direction == "up" ? [0, 1] : [1, 0]
      if value == initial && new_value == final && victim = @bad_hash[i]
        @memory[victim] = @value
      else
        @memory[i] = new_value
      end
    end

    def name
      "#{self.class.name} #{@addr}<#{@direction}, #{@value}>"
    end

  end
end
