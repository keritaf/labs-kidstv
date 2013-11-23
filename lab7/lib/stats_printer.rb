class StatsPrinter
  HEADER_WIDTH = 141
  WIDTH = 25

  def initialize(memory_name, errors, detected)
    @memory_name, @errors, @detected = memory_name, errors, detected
  end

  def self.print_header(name)
    printf "\n"
    puts "*".cyan * HEADER_WIDTH
    puts name.to_s.center(HEADER_WIDTH).cyan
    puts "*".cyan * HEADER_WIDTH
    puts "-" * (5 * (WIDTH+3) + 1)
    puts "| #{'Name'.center(WIDTH)} | #{'Count'.center(WIDTH)} | #{'Detected'.center(WIDTH)} | #{'Wrong'.center(WIDTH)} | #{'Efficiency'.center(WIDTH)} |"
    puts "-" * (5 * (WIDTH+3) + 1)
  end

  def print
    puts "| #{@memory_name.to_s.center(WIDTH)} | #{@errors.count.to_s.center(WIDTH)} | #{correct_errors.count.to_s.center(WIDTH)} | #{wrong_errors.count.to_s.center(WIDTH)} | #{(efficiency*100).round(2).to_s.center(WIDTH)} |"
  end

  def wrong_errors
    @detected - correct_errors
  end

  def correct_errors
    @errors & @detected
  end

  def efficiency
    correct_errors.count.to_f / @errors.count
  end
end
