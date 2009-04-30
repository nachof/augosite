# Like bye, but game lost
module Tournament
  class Quit
    attr_accessor :player
    def initialize(player)
      @player = player
    end
    def won?
      false
    end
    def opponent
      @op ||= Nobody.new("Quit")
    end
    def result
      ""
    end
    def color
      ""
    end
  end
end

