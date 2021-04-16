class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? {|char| Code::POSSIBLE_PEGS.include?(char.upcase)}
  end

  def self.random(length)
    pegs = Array.new(length) {Code::POSSIBLE_PEGS.keys.sample}
    Code.new(pegs)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "does not contain valid pegs"
    end
  end

  def [](indx)
    pegs[indx]
  end

  def length
    pegs.length
  end

  def num_exact_matches(guess)
    (0...guess.length).count {|i| guess[i] == pegs[i]}
  end

  def num_near_matches(guess)
    no_of_matches = (0...guess.length).count do |i|
      guess_peg = guess[i]
      pegs.include?(guess_peg)
    end

    no_of_matches - self.num_exact_matches(guess)
  end

  def ==(code)
    self.length == code.length && self.num_exact_matches(code) == self.length
  end

end
