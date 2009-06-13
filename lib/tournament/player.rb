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
      @opponents = []
    end

    def add_opponent o
      @opponents << o
    end

    def sos
      @opponents.collect(&:score).inject(&:+)
    end

    def sosos
      @opponents.collect(&:sos).inject(&:+)
    end
  end
end
