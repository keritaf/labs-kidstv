require_relative 'cfin'

module Memory
  class Cfid < Cfin

    def []=(i, val)
      if victim = @bad_hash[i]
        @memory[victim] = 0
      end
        @memory[i] = val
    end

  end
end
