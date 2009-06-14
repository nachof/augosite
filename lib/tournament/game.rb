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
    def self.opponent; Nobody; end
    def self.won; true; end
    def self.result; 'Bye'; end
  end
end
