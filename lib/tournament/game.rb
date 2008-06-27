module Tournament
  class Game
    attr_accessor :black, :white, :round, :result

    def initialize(options = {})
      @black = options[:black]
      @white = options[:white]
      @round = options[:round]
      @result = options[:result]
    end

    def self.from_raw(data, options = {})
        black = Player[data['black']['ip']]
        white = Player[data['white']['ip']]
        result = Result.from_string(data['result'])
        game = new(:black => black, :white => white, :round => options[:round], :result => result)
        [white, black].each { |player| player.add_game game }
        game
    end
  end
end
