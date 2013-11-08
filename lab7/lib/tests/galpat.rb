require_relative 'base'

module Tests
  class Galpat < Base

    def perform
      0.upto(@size-1) do |cursor|
        # Write zeros
        0.upto(@size-1) { |i| @memory[i] = 0 }

        # Write one to base cell
        @memory[cursor] = 1

        # Test system
        0.upto(@size-1) do |i|
          value = i == cursor ? 1 : 0
          @errors << i unless @memory[i] == value
        end

      end
    end

  end
end
