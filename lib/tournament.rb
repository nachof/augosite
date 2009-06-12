require File.join(File.dirname(__FILE__), 'tournament', 'tournament')
require File.join(File.dirname(__FILE__), 'tournament', 'player')

require 'yaml'

module Tournament
module_function
  def load string, id
    data = YAML.load string
    Tournament.load data, id
  end

  def load_from_file fname
    load(File.read(fname), File.basename(fname).split('.')[0])
  end

  def load_dir dir
    list(dir).collect { |f| load_from_file(File.join(dir, f)) }
  end

  def list dir
    Dir.entries(dir).select { |f| /^.+\.yaml/.match(f) }.sort
  end
end
