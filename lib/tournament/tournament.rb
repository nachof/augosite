module Tournament
  class Tournament
    attr_reader :id, :name, :description, :rounds, :players, :tiebreaks

    def self.load raw, id
      tournament = Tournament.new id, raw['name'], raw['description'], tbparts(raw['tiebreak']), raw['rounds']
      raw['players'].each { |praw| tournament.add_player Player.load(praw) }
      roundnum = 0
      raw['games'].each do |round|
        roundnum += 1
        round.each do |game|
          if game['white'].nil?
            unless game['bye'].nil?
              tournament.players[game['bye']['ip']].add_game(roundnum, Game.new(Nobody, true, 'Bye'))
            end
          else
            winner = game['result'].split('+')[0]
            pw,pb = ['white','black'].collect { |c| tournament.players[game[c]['ip']] }
            pw.add_game(roundnum, Game.new(pb, (winner == 'W'), game['result']))
            pb.add_game(roundnum, Game.new(pw, (winner == 'B'), game['result']))
          end
        end
      end
      tournament
    end

    def self.tbparts tiebreaks
      (tiebreaks || '').split(',').map(&:to_sym)
    end

    def initialize id, name, description, tiebreaks, rounds
      @id          = id
      @name        = name
      @description = description
      @tiebreaks   = tiebreaks
      @rounds      = rounds
      @players     = {}
    end

    def add_player player
      @players[player.ip] = player
    end

    def sorted_players
      @players.values.sort do |a,b|
        criteria = [:score] + @tiebreaks + [:ip] # first score, tehn the tiebreaks, then ip
        values_a = criteria.collect { |c| a.send(c) }
        values_b = criteria.collect { |c| b.send(c) }
        values_b <=> values_a
      end
    end
  end
end
