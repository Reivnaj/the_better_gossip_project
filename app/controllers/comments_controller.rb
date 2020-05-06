class CommentsController < ApplicationController

  def create
   	@gossip = Gossip.find(params[:gossip_id])
  	@comment = @gossip.comments.new(comment_params)
  	# Temporaire
  	anonymous = User.find_by(first_name: "anonymous")
  	@comment.user = anonymous

  	if @comment.save
  		redirect_to gossip_path(@gossip)
  	else
  		redirect_to gossip_path(@gossip), alert: "Tu n'as rien écris ..."
  	end
  end

  private

  def comment_params
  	params.require(:comment).permit(:content)
  end
end
