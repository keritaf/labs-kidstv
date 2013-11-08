module Tests
  class Base
    attr_reader :errors

    def initialize(memory, size)
      @memory, @size = memory, size
      @errors = Set.new([])
    end

    def perform
      raise NotImplementedError
    end

  end
end
