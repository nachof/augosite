module Tournament
  class Base
    attr_accessor :rounds, :players, :tiebreaks, :description, :name, :id

    def initialize(id, data)
      @players = Hash[*data['players'].map { |p| [p['ip'], Player.new(p['ip'], p['name'], p['level'])] }.flatten]
      round_number = 0
      data['games'].each do |round|
        round_number = round_number + 1
        round.each do |game_data|
          Game.from_raw(game_data, :round => round_number, :tournament => self)
        end
      end
      @description = data['description']
      @rounds = round_number
      @tiebreaks = (data['tiebreak'] || "").split(',').map(&:strip).map(&:to_sym)
      @id = id
      @name = data['name']
    end

    def sorted_players
      pls = @players.to_a.collect { |key,val| val }.sort do |a,b|
        funcs = [ :score ] + @tiebreaks + [ :ip ]
        ar_a = funcs.collect { |f| a.send(f) }
        ar_b = funcs.collect { |f| b.send(f) }
        ar_b <=> ar_a
      end
      pls
    end
  end
end
