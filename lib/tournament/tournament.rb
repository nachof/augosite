module Tournament
  class Tournament
    attr_reader :id, :name, :description, :rounds, :players

    def self.load raw, id
      tournament = Tournament.new id, raw['name'], raw['description'], raw['rounds']
      raw['players'].each { |praw| tournament.add_player Player.load(praw) }
      raw['games'].each do |round|
        round.each do |game|
          if game['white'].nil?
            unless game['bye'].nil?
              tournament.players[game['bye']['ip']].score += 1
            end
          else
            winner = game['result'].split('+')[0]
            tournament.players[game['white']['ip']].score += 1 if winner == 'W'
            tournament.players[game['black']['ip']].score += 1 if winner == 'B'
          end
        end
      end
      tournament
    end

    def initialize id, name, description, rounds
      @id          = id
      @name        = name
      @description = description
      @rounds      = rounds
      @players     = {}
    end

    def add_player player
      @players[player.ip] = player
    end
  end
end
