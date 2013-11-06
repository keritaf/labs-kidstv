class Cover

  def initialize
    @cover = {ones: [], zeros: []}
  end

  def merge(faults)
    unless contains?(faults)
      @cover[:zeros] = @cover[:zeros] | faults[:zeros]
      @cover[:ones]  = @cover[:ones]  | faults[:ones]
    end
  end

  def full?
    (FaultHunter::MOCKS - @cover[:zeros]).empty? &&
    (FaultHunter::MOCKS - @cover[:ones]).empty?
  end

  private

  def contains?(faults)
    ((@cover[:zeros] | faults[:zeros]) - @cover[:zeros]).empty? &&
    ((@cover[:ones]  | faults[:ones])  - @cover[:ones]).empty?
  end

end
