require 'rubygems'
require 'sinatra'
Sinatra::Application.default_options.merge!(
  :views => File.join(File.dirname(__FILE__), 'views'),
  :run => false,
  :env => ENV['RACK_ENV'] || :production
)

require 'site'
run Sinatra.application 
