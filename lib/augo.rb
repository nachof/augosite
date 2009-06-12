module AUGO
  module_function

  def data_path what=''
    File.join(File.dirname(__FILE__), '..', 'data', what)
  end
end
