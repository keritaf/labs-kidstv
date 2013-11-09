require_relative 'march'

module Tests
  class MarchA < March

    def perform
      any(w0)
      up(r0, w1, w0, w1)
      up(r1, w0, w1)
      down(r1, w0, w1, w0)
      down(r0, w1, w0)
    end

  end
end
