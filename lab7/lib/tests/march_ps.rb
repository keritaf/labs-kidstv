require_relative 'march'

module Tests
  class MarchPs < March

    def perform
      any(w0)
      up(r0, w1, r1, w0, r0, w1)
      up(r1, w0, r0, w1, r1)
      up(r1, w0, r0, w1, r1, w0)
      up(r0, w1, r1, w0, r0)
    end

  end
end
