require File.join(File.dirname(__FILE__), 'tournament', 'player')

require 'yaml'

module Tournament
  class Tournament
    attr_reader :name, :rounds, :players

    def self.load raw
      tournament = Tournament.new raw['name'], raw['rounds']
      raw['players'].each { |praw| tournament.add_player Player.load(praw) }
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

module_function
  def load string
    data = YAML.load string
    Tournament.load data
  end
end
