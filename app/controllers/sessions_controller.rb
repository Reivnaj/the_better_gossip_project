class SessionsController < ApplicationController

  def new

  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
	  user = User.find_by(email: params[:email])
	  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe

    if user && user.authenticate(params[:password])
	  	log_in(user)
	    # redirige où tu veux, avec un flash ou pas
      user.update(password: params[:password])
      remember(user) if remember_me

      flash[:success] = "Bravo ! Tu es bien connecté !"
      redirect_to gossips_path
	  else
	  	flash.now[:danger] = 'Invalid email/password combination'
	  	render 'new'
	  end
	end

  def destroy
  	log_out(current_user)

  	flash[:success] = "Tu t'es déconnecté. Au revoir"
  	redirect_to new_session_path
  end

  def remember_me
    !params[:remember_me].nil?
  end

end
