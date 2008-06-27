module Tournament
  class PlayerGame
    attr_accessor :player

    def initialize(player, game)
      @player = player
      @game   = game
    end

    def color
      @game.white == @player ? "W" : "B"
    end

    def won?
      @game.result.winner == color
    end

    def result
      @game.result
    end

    def opponent
      @game.white == @player ? @game.black : @game.white
    end
  end
end
