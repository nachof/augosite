module Tournament
  class Nobody
    def initialize name
      @name = name
    end
    def name
      @name
    end
    def ip
      @name
    end
    def method_missing(name)
      0
    end
  end
end
