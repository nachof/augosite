module AUGO
  module_function

  def root_path
    File.join(File.dirname(__FILE__), '..') 
  end

  def data_path what=''
    File.join(root_path, 'data', what)
  end

  def public_path
    File.join(root_path, 'public')
  end
end
