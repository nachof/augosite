require 'rubygems'
require 'sinatra'

require 'helpers'

get '/' do
  haml :default
end

get '/calendario' do
  t = Time.now
  display_calendar(t.year, t.month)
end

get '/calendario/:year/:month' do
  display_calendar(params[:year], params[:month])
end

get '/img/randomheader.jpg' do
  send_file 'public/img/headers/' + (rand(7) + 1).to_s + '.jpg'
end

get '/:anypage' do
  haml params[:anypage].to_sym
end
