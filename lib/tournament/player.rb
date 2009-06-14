module Tournament
  class Player
    attr_accessor :ip, :name
    attr_reader :rounds

    def self.load raw
      new raw['ip'], raw['name']
    end

    def initialize ip, name
      @ip = ip
      @name = name
      @rounds = {}
    end

    def add_game round, game
      @rounds[round] = game
    end

    def score
      games.select(&:won).count
    end

    def sos
      opponents.collect(&:score).inject(&:+)
    end

    def sosos
      opponents.collect(&:sos).inject(&:+)
    end

    def sodos
      games.select(&:won).collect(&:opponent).collect(&:score).inject(0, &:+)
    end

  private
    def games
      @rounds.values
    end

    def opponents
      games.collect(&:opponent)
    end

  end

  class Nobody
    # Bye pseudoopponent
    def self.score
      0
    end

    def self.sos
      0
    end
  end
end
