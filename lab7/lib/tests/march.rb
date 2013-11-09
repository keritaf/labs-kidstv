require_relative 'base'

module Tests
  class March < Base

    WINDOW = 12

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

    def before(*args)
      (@size - 1).downto(0) do |i|
        args.each { |arg| arg.call(i) }
      end
    end

    def after(*args)
      0.upto(@size - 1) do |i|
        args.each { |arg| arg.call(i) }
      end
    end

    def random(*args)
      rand(0.0..1.0) > 0.5 ? before(*args) : after(*args)
    end

    def num
      (WINDOW-1 * rand(0.1..1.0)).round
    end

  end
end

