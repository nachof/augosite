module Tournament
  class Player
    attr_accessor :ip, :name, :score

    def self.load raw
      new raw['ip'], raw['name']
    end

    def initialize ip, name
      @ip = ip
      @name = name
      @score = 0
      @games = []
    end

    def add_game g
      @games << g
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
end
