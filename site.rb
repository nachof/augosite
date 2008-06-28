require 'rubygems'
require 'sinatra'

require 'helpers'

get '/' do
  haml :default
end

get '/img/randomheader.jpg' do
  send_file 'public/img/headers/' + (rand(7) + 1).to_s + '.jpg'
end

get '/calendario' do
  haml :calendario
end

get '/torneos/:tournament_id' do
  haml :torneo, :locals => { :tournament => Tournament::load(params[:tournament_id]) }
end

get '/torneos' do
  haml :torneos, :locals => { :tournaments => Tournament::list }
end

get '/:anypage' do
  haml params[:anypage].to_sym
end
