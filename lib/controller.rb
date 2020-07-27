require 'gossip'

class ApplicationController < Sinatra::Base    # hérite de toutes les fonctionnalitées de base de Sinatra
  get '/' do
   erb :index, locals: {gossips: Gossip.all}    # Sinatra doit aller chercher le fichier index.erb rangé dans le dossier /views
  end

  get '/gossips/new/' do #on envoie ver l'url qui crée un gossip
  	erb :new_gossip
  end

  post '/gossips/new/' do  
  	Gossip.new(params["gossip_author"], params["gossip_content"]).save #on crée un gossip et on l'enregistre
  	redirect '/' #on redirige après quoi vers la page d'accueil
	end

	#get '/gossip/:id' do
  
	#end

end