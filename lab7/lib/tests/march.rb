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

    def before(i, *args)
      return if i < WINDOW
      args.each do |arg|
        index = i - num
        arg.call(index)
      end
    end

    def after(i, *args)
      return if i > @size - WINDOW
      args.each do |arg|
        index = i + num
        arg.call(index)
      end
    end

    def random(i, *args)
      args.each do |arg|
        sign = rand(0.0..1.0) > 0.5 ? -1 : 1
        index = i + sign * num
        arg.call(index)
      end
    end

    def num
      (WINDOW-1 * rand(0.1..1.0)).round
    end

  end
end

