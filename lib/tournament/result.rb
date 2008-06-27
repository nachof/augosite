module Tournament
  class Result
    attr_accessor :winner, :reason

    def initialize(winner, reason)
      @winner = winner
      @reason = reason
    end

    def to_s
      "#{@winner}+#{@reason}"
    end

    def self.from_string(string)
      new(*string.split('+'))
    end
  end
end
