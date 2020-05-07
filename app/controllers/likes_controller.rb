class LikesController < ApplicationController
	before_action :authenticate_user, only: [:create, :destroy]

	def create
		@gossip = Gossip.find(params[:gossip_id])
		if Like.where(gossip: @gossip, user: current_user).empty?
			@like = Like.create(user: current_user, gossip: @gossip, is_liked: true)
		end
		redirect_to gossip_path(@gossip)
	end

	def destroy
		@gossip = Gossip.find(params[:gossip_id])
    @like = @gossip.likes.find(params[:id])
    @like.destroy
    redirect_to gossip_path(@gossip)
	end

	private

  def authenticate_user
    unless current_user
      flash[:danger] = "Tu n'es pas connecté !"
      redirect_to new_session_path
    end
  end

end
