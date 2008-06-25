module AUGO
  module_function

  def data_path
    File.join(File.dirname(__FILE__), '..', 'data')
  end
end
