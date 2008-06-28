require 'yaml'
require 'lib/tournament/player'
require 'lib/tournament/game'
require 'lib/tournament/result'
require 'lib/tournament/player_game'
require 'lib/tournament/base'
require 'lib/tournament/bye'
require 'lib/tournament/nobody'

module Tournament
  module_function

  def load(tournament_id)
    data = YAML.load File.open(filename(tournament_id))
    data['players'].each { |p| Player.new(p['ip'], p['name'], p['level']) }
    round_number = 0
    data['games'].each do |round|
      round_number = round_number + 1
      round.each do |game_data|
        Game.from_raw(game_data, :round => round_number)
      end
    end
    Base.new data['name'], :description => data['description'],
                           :rounds=> round_number,
                           :players => Player.all,
                           :tiebreaks => data['tiebreak'],
                           :id => tournament_id
  end

  def list
    Dir.entries(tournaments_path).select { |f| /^.+\.yaml/.match(f) }.sort.collect { |fn| load fn.split('.')[0] }
  end

  def filename(tournament_id)
    File.join(tournaments_path, "#{tournament_id}.yaml")
  end

  def tournaments_path
    File.join(AUGO::data_path, 'torneos')
  end
end
