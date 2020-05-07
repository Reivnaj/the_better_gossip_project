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
    puts params
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
  	if @comment.update(content: params[:content])
  		redirect_to @gossip
  	else
  		render :edit
  	end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
    @comment.destroy
    redirect_to @gossip
  end

  private

  def comment_params
  	params.require(:comment).permit(:content)
  end
end
