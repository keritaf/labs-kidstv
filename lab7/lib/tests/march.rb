require_relative 'base'

module Tests
  class March < Base

    def perform
      raise NotImplementedError
    end

    protected

    def w0
      @w0 ||= ->(i) { @memory[i] = 0 }
    end

    def w1
      @w1 ||= ->(i) { @memory[i] = 1 }
    end

    def r0
      @r0 ||= ->(i) { @errors << i unless @memory[i] == 0 }
    end

    def r1
      @r1 ||= ->(i) { @errors << i unless @memory[i] == 1 }
    end

    def down(*args)
      (@size - 1).downto(0) do |i|
        args.each { |arg| arg.call(i) }
      end
    end

    def up(*args)
      0.upto(@size - 1) do |i|
        args.each { |arg| arg.call(i) }
      end
    end

    def any(*args)
      rand(0.0..1.0) > 0.5 ? up(*args) : down(*args)
    end

  end
end

