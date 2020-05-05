class GossipsController < ApplicationController
  def new
  	@gossip = Gossip.new
  end

  def create

  end

  def show
    @gossip = Gossip.find(params['id'])
  end
end
