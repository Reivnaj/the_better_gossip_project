class UsersController < ApplicationController
  def show
    @user = User.find(params['id'])
  end

  def new
    @user = User.new
    @all_cities = City.all
  end

  def create
    @user = User.new(user_params) # avec xxx qui sont les données obtenues à partir du formulaire
    if @user.save # essaie de sauvegarder en base @user
      # si ça marche, il message "Bravo ! Tu es inscri ! " redirige vers la page d'index du site
      flash[:success] = "Bravo ! Tu es inscrit !"
      log_in(@user)
      remember(@user) if remember_me == "1"
      redirect_to gossips_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description, :age, :city_id, :password)
  end

  def remember_me
    params.require(:user)[:remember_me]
  end

end
