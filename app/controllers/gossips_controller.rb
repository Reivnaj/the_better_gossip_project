class GossipsController < ApplicationController
  
  def index
    @all_gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params['id'])
  end

  def new
  	@gossip = Gossip.new
  end

  def create
    user = User.find_by(first_name: "anonymous")
    @gossip = Gossip.new(gossip_params) # avec xxx qui sont les données obtenues à partir du formulaire
    @gossip.user = user
    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il message: "email adress please"edirige vers la page d'index du site
      redirect_to 'gossips/', alert: "Potin créé ! Bravo !"
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render :new
    end

  end

  def edit
    @gossip = Gossip.find(params['id'])
  end

  def update
  	@gossip = Gossip.find(params[:id])
  	if @gossip.update(gossip_params)
  		redirect_to @gossip
  	else
  		render :edit
  	end
  end

  private
  
  def gossip_params
  	params.require(:gossip).permit(:title, :content)
  end

end
