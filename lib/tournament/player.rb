module Tournament
  class Player
    attr_accessor :ip, :name, :level, :rounds

    def initialize(ip, name, level)
      @ip    = ip
      @name  = name
      @level = level
    end

    def add_game(game)
      @rounds ||= {}
      @rounds[game.round] = PlayerGame.new(self, game)
    end

    def games
      @rounds.to_a.collect { |a,b| b}
    end

    def score
      games.select { |game| game.won? }.size
    end

    def sos
      games.collect(&:opponent).collect(&:score).inject(&:+)
    end

    def sosos
      games.collect(&:opponent).collect(&:sos).inject(&:+)
    end

    def sodos
      games.select(&:won?).collect(&:opponent).collect(&:score).inject(&:+)
    end

    def add_bye(round)
      @rounds ||= {}
      @rounds[round] = Bye.new(self)
    end

    def add_quit(round)
      @rounds ||= {}
      @rounds[round] = Quit.new(self)
    end
  end
end
