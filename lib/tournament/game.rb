module Tournament
  class Game
    attr_reader :opponent, :won, :result

    def initialize opponent, won, result
      @opponent = opponent
      @won      = won
      @result   = result
    end
  end
end
