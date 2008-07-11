module Tournament
  class Base
    attr_accessor :rounds, :players, :tiebreaks, :description, :name, :id
    def initialize(name, options={})
      @name    = name
      @description = options[:description]
      @rounds  = options[:rounds]
      @players = options[:players]
      @id = options[:id]
      @tiebreaks = (options[:tiebreaks] || "").split(',').map(&:strip).map(&:to_sym)
      @tiebreaks = [ :sos, :sosos ] if @tiebreaks.empty?
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
