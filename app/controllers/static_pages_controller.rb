class StaticPagesController < ApplicationController

  def home

  end

  def contact

  end

  def welcome
    @first_name = params['first_name']

  end

  def index
  	# Cette méthode va récupérer tous les potins en base
    @all_gossips = Gossip.get_all
  end

  def gossip
    @all_gossips = Gossip.get_all
    @gossip = Gossip.find(params['id'])
  end

end
