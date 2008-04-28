require 'rubygems'
require 'sinatra'

get '/' do
  haml :default
end

get '/:anypage' do
  haml params[:anypage].to_sym
end
