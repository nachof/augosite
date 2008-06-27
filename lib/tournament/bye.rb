module Tournament
  class Bye
    attr_accessor :player
    def initialize(player)
      @player = player
    end
    def won?
      true
    end
    def opponent
      Nobody
    end
    def result
      ""
    end
    def color
      ""
    end
  end
end
