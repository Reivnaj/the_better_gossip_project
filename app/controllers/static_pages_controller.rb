class StaticPagesController < ApplicationController

  def home

  end

  def contact

  end

  def welcome
    @first_name = params['first_name']
  end


  def user
    @user = User.find(params['id'])
  end

end
