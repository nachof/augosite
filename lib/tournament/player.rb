module Tournament
  class Player
    attr_accessor :ip, :name

    def self.load raw
      new raw['ip'], raw['name']
    end

    def initialize ip, name
      @ip = ip
      @name = name
    end
  end
end
