class FaultHunter

  INPUTS = %i(x0 x1 x2 x3 x4 x5 x6)
  OUTPUTS = %i(f1 f2 f3 f4 f5 f6)
  MOCKS = [INPUTS, OUTPUTS].flatten

  def initialize(test)
    @test = test
  end

  def faults
    {signals: signals, zeros: const_faults(0), ones: const_faults(1)}
  end

  def const_faults(signal)
    standart = Scheme.new.process(@test)

    MOCKS.each_with_object([]) do |mock, errors|
      scheme = Scheme.new(mock: {mock => signal})
      errors << mock if scheme.process(@test) != standart
    end

  end

  def signals
    scheme = Scheme.new
    scheme.process(@test)

    OUTPUTS.each_with_object({}) do |signal, hash|
      hash[signal] = scheme.send(signal)
    end

  end

end
