require_relative 'march'

module Tests
  class MarchA < March

    WINDOW = 15

    def perform
      random(w0)
      after(r0, w1, w0, w1)
      after(r1, w0, w1)
      before(r1, w0, w1, w0)
      before(r0, w1, w0)
    end

  end
end

