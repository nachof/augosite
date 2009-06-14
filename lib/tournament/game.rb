module Tournament
  class Game
    attr_reader :opponent, :won, :result, :color

    def initialize opponent, won, result, color
      @opponent = opponent
      @won      = won
      @result   = result
      @color    = color
    end
  end

  class ByeRound
    # Bye pseudo game
    def self.opponent; ByeNobody; end
    def self.won; true; end
    def self.result; 'Bye'; end
    def self.color; ''; end
  end

  class UnplayedRound
    # Bye pseudo game
    def self.opponent; Nobody; end
    def self.won; false; end
    def self.result; ''; end
    def self.color; ''; end
  end
end
