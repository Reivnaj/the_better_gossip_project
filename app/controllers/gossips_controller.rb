class GossipsController < ApplicationController
  def new
  	@gossip = Gossip.new
  end

  def create
    user = User.find_by(first_name: "anonymous")
    @gossip = Gossip.new(user: user, title: params['title'], content: params['content']) # avec xxx qui sont les données obtenues à partir du formulaire

    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      redirect_to "/"
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render :action => "new"
    end

  end

  def show
    @gossip = Gossip.find(params['id'])
  end
end
