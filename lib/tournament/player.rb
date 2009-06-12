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
    end
  end
end
