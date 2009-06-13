module Tournament
  class Player
    attr_accessor :ip, :name

    def self.load raw
      new raw['ip'], raw['name']
    end

    def initialize ip, name
      @ip = ip
      @name = name
      @games = []
    end

    def add_game g
      @games << g
    end

    def score
      @games.select(&:won).count
    end

    def sos
      @games.collect(&:opponent).collect(&:score).inject(&:+)
    end

    def sosos
      @games.collect(&:opponent).collect(&:sos).inject(&:+)
    end

    def sodos
      @games.select(&:won).collect(&:opponent).collect(&:score).inject(0, &:+)
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
