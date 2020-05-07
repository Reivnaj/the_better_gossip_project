class CommentsController < ApplicationController

  def create

   	@gossip = Gossip.find(params[:gossip_id])
  	@comment = @gossip.comments.new(comment_params)
  	
  	@comment.user = current_user

  	if @comment.save
  		redirect_to gossip_path(@gossip)
  	else
  		redirect_to gossip_path(@gossip), alert: "Tu n'as rien écris ..."
  	end
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
  	@comment = @gossip.comments.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])

  	if @comment.update(comment_params)
  		redirect_to @gossip
  	else
  		render :edit
  	end

  end

  private

  def comment_params
  	params.require(:comment).permit(:content)
  end
end
