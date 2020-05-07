class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]
  before_action :author_is_curent_user ,only: [:edit, :update, :destroy]

  def index
    @all_gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params['id'])
  end

  def new
  	@gossip = Gossip.new
    @all_tags = Tag.all
  end

  def create

    @gossip = Gossip.new(gossip_params)
    @gossip.user = current_user # avec xxx qui sont les données obtenues à partir du formulaire
    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il message: "email adress please"edirige vers la page d'index du site
      flash[:success] = "Potin créé ! Bravo !"
      redirect_to gossips_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render :new
    end

  end

  def edit
    @gossip = Gossip.find(params['id'])
    @all_tags = Tag.all
  end

  def update
  	@gossip = Gossip.find(params[:id])
  	if @gossip.update(gossip_params)
  		redirect_to @gossip
  	else
  		render :edit
  	end
  end

  def destroy
    @gossip = Gossip.find(params['id'])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def gossip_params
  	params.require(:gossip).permit(:title, :content)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Tu n'es pas connecté !"
      redirect_to new_session_path
    end
  end

  def author_is_curent_user
    unless current_user == Gossip.find(params['id']).user 
      flash[:danger] = "Tututut qu'est-ce que tu fais là ?!"
      redirect_to gossips_path
    end
  end

end
