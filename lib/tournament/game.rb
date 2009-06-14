module Tournament
  class Game
    attr_reader :opponent, :won, :result

    def initialize opponent, won, result
      @opponent = opponent
      @won      = won
      @result   = result
    end
  end

  class ByeRound
    # Bye pseudo game
    def self.opponent; Nobody; end
    def self.won; true; end
    def self.result; 'Bye'; end
  end
end
