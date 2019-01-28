require 'gossip'

class ApplicationController < Sinatra::Base
	get '/' do
		erb :index, locals: {gossips: Gossip.all}	
	end
	get '/gossips/new/' do
		erb :new_gossip
	end
	post '/gossips/new/' do
		Gossip.new(params["gossip_author"],params["gossip_content"]).save
		redirect '/'
	end
	get '/gossip/:id' do |id|
		erb :gossip_display, locals: {gossip: Gossip.all[id.to_i] , id: id}
	end
	post '/gossip/modify/:id' do |id|
		Gossip.all[id.to_i].modify(params["gossip_author"],params["gossip_content"])
		redirect '/'
	end
end