class StaticPagesController < ApplicationController

  def home

  end

  def contact

  end

  def welcome
    @first_name = params['first_name']
  end

  def index
    @all_gossips = Gossip.all
  end

  def gossip
    @gossip = Gossip.find(params['id'])
  end

  def user
    @user = User.find(params['id'])
  end

end
