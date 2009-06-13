module Tournament
  class Game
    attr_reader :opponent, :won

    def initialize opponent, won
      @opponent = opponent
      @won = won
    end
  end
end
