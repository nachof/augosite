helpers do
  def make_link(url, title, description)
    haml :_link, :locals => { :url => url, :title => title, :description => description }, :layout => false
  end
end
