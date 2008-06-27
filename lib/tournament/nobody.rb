module Tournament
  class Nobody
    def self.name
      "Bye"
    end
    def self.ip
      "Bye"
    end
    def self.method_missing(name)
      0
    end
  end
end
