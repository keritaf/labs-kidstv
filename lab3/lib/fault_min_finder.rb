class FaultMinFinder

  def initialize(faults)
    @faults = faults
  end

  def perform
    cover = {ones: [], zeros: []}
    tests = []
    ordered_faults.each do |test, faults|

      unless contains?(cover, faults)
        tests << test
        cover[:zeros] = cover[:zeros] | faults[:zeros]
        cover[:ones]  = cover[:ones] | faults[:ones]
      end

      break if full_cover?(cover)
    end
    tests
  end

  private

  def ordered_faults
    @faults.sort_by {|test, f| f[:zeros].size + f[:ones].size}.reverse
  end

  def full_cover?(cover)
    (FaultHunter::MOCKS - cover[:zeros]).empty? &&
    (FaultHunter::MOCKS - cover[:ones]).empty?
  end

  def contains?(cover, faults)
    ((cover[:zeros] | faults[:zeros]) - cover[:zeros]).empty? &&
    ((cover[:ones] | faults[:ones]) - cover[:ones]).empty?
  end

end
