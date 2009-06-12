module Tournament
  class Tournament
    attr_reader :name, :rounds, :players

    def self.load raw
      tournament = Tournament.new raw['name'], raw['rounds']
      raw['players'].each { |praw| tournament.add_player Player.load(praw) }
      raw['games'].each do |round|
        round.each do |game|
          tournament.players[game['white']['ip']].score += 1
        end
      end
      tournament
    end

    def initialize name, rounds
      @name = name
      @rounds = rounds
      @players = {}
    end

    def add_player player
      @players[player.ip] = player
    end
  end
end