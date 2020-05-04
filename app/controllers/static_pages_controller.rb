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
end
