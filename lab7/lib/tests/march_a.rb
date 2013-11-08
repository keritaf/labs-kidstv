require_relative 'march'

module Tests
  class MarchA < March

    WINDOW = 15

    def perform
      0.upto(@size-1) do |i|
        random(i, w0)
        after(i, r0, w1, w0, w1)
        after(i, r1, w0, w1)
        before(i, r1, w0, w1, w0)
        before(i, r0, w1, w0)
      end
    end

  end
end

