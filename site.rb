require 'rubygems'
require 'sinatra'

get '/' do
  haml :default
end

get '/img/randomheader.jpg' do
  send_file 'public/img/headers/' + (rand(7) + 1).to_s + '.jpg'
end

get '/:anypage' do
  haml params[:anypage].to_sym
end
