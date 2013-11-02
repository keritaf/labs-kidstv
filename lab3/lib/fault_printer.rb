class FaultPrinter

  CENTER = 35

  def initialize(faults)
    @faults = faults
  end

  def print(io)
    io.puts headers
    io.puts '-' * headers.size
    @faults.each do |test, faults|
      io.puts format(test, faults)
    end
  end

  def headers
    headers = "|"
    headers << FaultHunter::MOCKS.map {|mock| " #{mock.to_s} |" }.join
    headers << " #{'ZEROS'.center(CENTER)}|"
    headers << " #{'ONES'.center(CENTER)}|"
    headers << " #{'COUNT'.center(5)}|"
  end

  def format(test, faults)
    row = '|'

    test.each do |v|
      row << "  #{v} |"
    end

    FaultHunter::OUTPUTS.each do |output|
      row << "  #{faults[:signals][output]} |"
    end

    count = faults[:zeros].size + faults[:ones].size
    row << " #{faults[:zeros].inspect.center(CENTER)}|"
    row << " #{faults[:ones].inspect.center(CENTER)}|"
    row << " #{count.to_s.center(5)}|"

    row
  end
end
