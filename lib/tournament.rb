require File.join(File.dirname(__FILE__), 'tournament', 'tournament')
require File.join(File.dirname(__FILE__), 'tournament', 'player')

require 'yaml'

module Tournament
module_function
  def load string
    data = YAML.load string
    Tournament.load data
  end
end
