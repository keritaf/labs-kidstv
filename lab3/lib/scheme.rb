class Scheme

  INPUTS = 7

  def initialize(mock: {})
    @mock = mock
  end

  0.upto(INPUTS) do |i|
    define_method "x#{i}".to_sym do
      @mock["x#{i}".to_sym] || @signals[i]
    end
  end

  def f1
    @mock[:f1] || Function.new('and', x0, x1).value
  end

  def f2
    @mock[:f2] || Function.new('not', x2).value
  end

  def f3
    @mock[:f3] || Function.new('or',  x4, x5).value
  end

  def f4
    @mock[:f4] || Function.new('and', x3, x6, f3).value
  end

  def f5
    @mock[:f5] || Function.new('nor', f2, f4).value
  end

  def f6
    @mock[:f6] || Function.new('and', f1, f5).value
  end

  def process(signals)
    @signals = signals
    f6
  end

end
