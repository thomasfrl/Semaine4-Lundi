require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'router.rb'
require 'gossip.rb'
require 'view.rb'
require 'controller.rb'

#Router.new.perform

get '/hello' do
	'<h1>Hello world ! </h1>'
end

get '/bonjour' do
	'<h1>Bonjour, monde !</h1>'
end


get /\/hello\/([\w]+)/ do
  "Hello, #{params['captures'].first}!"
end