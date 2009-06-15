require 'rubygems'
require 'sinatra'

require 'helpers'

get '/:stylesheet.css' do
  header "Content-Type" => "text/css"
  sass params[:stylesheet].to_sym
end

get '/' do
  haml :default
end

get '/img/randomheader.jpg' do
  response.headers['Cache-Control'] = "max-age=1"
  send_file 'public/img/headers/' + (rand(3) + 1).to_s + '.jpg'
end

get '/calendario' do
  haml :calendario
end

get '/torneos/:tournament_id' do
  haml :torneo, :locals => { :tournament => Tournament.load_from_file(File.join(AUGO.data_path('torneos'), "#{params[:tournament_id]}.yaml")) }
end

get '/torneos' do
  haml :torneos, :locals => { :tournaments => Tournament.load_dir(AUGO.data_path('torneos')) }
end

get '/sgf/:tournament_id/:game' do
  haml :sgfview, :locals => { :sgffile => "/partidas/#{params[:tournament_id]}/#{params[:game]}.sgf" }, :layout => false
end

get '/:anypage' do
  haml params[:anypage].to_sym
end
